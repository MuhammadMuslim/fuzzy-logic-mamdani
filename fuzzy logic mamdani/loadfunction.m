clear;
clc;

%temperatur suhu udara

x1=0:0.1:50;%range/rentang dalam skala derajat
crisp1=30;
max=18; min=5; [fuzzydingin] = Fuzzifikasi(crisp1,max,min,'function_2');
max=28; min=15; [fuzzysedang] = Fuzzifikasi(crisp1,max,min,'function_2'); %panggil function Fuzzifikasi
max=50; min=30; [fuzzypanas] = Fuzzifikasi(crisp1,max,min,'function_1');

disp(['Dingin  (D)=',num2str(fuzzydingin)]);
disp(['Normal  (N)=',num2str(fuzzysedang)]);
disp(['Panas   (P)=',num2str(fuzzypanas)]);

x=0:1:100;%range/rentang dalam skala persen
crisp2=55;  
max=30; min=20; [fuzzybasah] = Fuzzifikasi(crisp2,max,min,'function_2');
max=60; min=35; [fuzzysedang] = Fuzzifikasi(crisp2,max,min,'function_1');
max=80; min=60; [fuzzykering] = Fuzzifikasi(crisp2,max,min,'function_1');

disp(['Basah   (B)=',num2str(fuzzybasah)]);
disp(['Normal  (N)=',num2str(fuzzysedang)]);
disp(['Kering  (K)=',num2str(fuzzykering)]);

crisp3=300;
max=70; min=30; [fuzzysebentar] = Fuzzifikasi(crisp3,max,min,'function_2');
max=155; min=120; [fuzzysedang] = Fuzzifikasi(crisp3,max,min,'function_2');
max=360; min=180; [fuzzylama] = Fuzzifikasi(crisp3,max,min,'function_1');

%ganti ke skala dari 100 sampai 0 
minSebentarNaik = 0;%patok batas bawah
maxSebentarNaik = 1.5;
minSebentarTurun = 1.5; maxSebentarTurun = 3;
minNormalNaik = 3; maxNormalNaik = 5;
minNormalTurun = 5; maxNormalTurun = 7;
minLamaNaik = 7; maxLamaNaik = 8.5;
%lanjutkan keatas
minLamaTurun = 85; maxLamaTurun = 100; %patokan batas atas

%load dan add rule
%IF suhu is panas AND kelembapan is basah THEN aktif is sebentar
[crispSebentar1, fuzzySebentar1] = RuleDanInferensi(fuzzypanas, fuzzybasah, minSebentarNaik, maxSebentarNaik, 'naik', 'AND'); %Hitung sj dulu yg naik
if (crispSebentar1 > minSebentarTurun) || (crispSebentar1 < maxSebentarTurun) %Cari antara naik atau turun
    [crispSebentar1, fuzzySebentar1] = RuleDanInferensi(fuzzypanas, fuzzybasah, minSebentarTurun, maxSebentarTurun, 'turun', 'AND');
end
%IF suhu is panas AND kelembapan is normal THEN aktif is sebentar
[crispSebentar2, fuzzySebentar2] = RuleDanInferensi(fuzzypanas, fuzzysedang, minSebentarNaik, maxSebentarNaik, 'naik', 'AND');
if (crispSebentar2 > minSebentarTurun) || (crispSebentar2 < maxSebentarTurun)
    [crispSebentar2, fuzzySebentar2] = RuleDanInferensi(fuzzypanas, fuzzysedang, minSebentarTurun, maxSebentarTurun, 'turun', 'AND');
end
%IF suhu is sedang AND kelembapan is dingin THEN aktif is sebentar
[crispSebentar3, fuzzySebentar3] = RuleDanInferensi(fuzzysedang, fuzzydingin, minSebentarNaik, maxSebentarNaik, 'naik', 'AND');
if (crispSebentar3 > minSebentarTurun) || (crispSebentar3 < maxSebentarTurun)
    [crispSebentar3, fuzzySebentar3] = RuleDanInferensi(fuzzysedang, fuzzydingin, minSebentarTurun, maxSebentarTurun, 'turun', 'AND');
end
%IF suhu is dingin AND kelembapan is basah THEN aktif is normal
[crispNormal1, fuzzyNormal1] = RuleDanInferensi(fuzzydingin, fuzzybasah, minNormalNaik, maxNormalNaik, 'naik', 'AND');
if (crispNormal1 > minNormalTurun) || (crispNormal1 < maxNormalTurun)
    [crispNormal1, fuzzyNormal1] = RuleDanInferensi(fuzzydingin, fuzzybasah, minNormalTurun, maxNormalTurun, 'turun', 'AND');
end
%IF suhu is normal AND kelembapan is normal THEN aktif is normal
[crispNormal2, fuzzyNormal2] = RuleDanInferensi(fuzzysedang, fuzzysedang, minNormalNaik, maxNormalNaik, 'naik', 'AND');
if (crispNormal2 > minNormalTurun) || (crispNormal2 < maxNormalTurun)
    [crispNormal2, fuzzyNormal2] = RuleDanInferensi(fuzzysedang, fuzzysedang, minNormalTurun, maxNormalTurun, 'turun', 'AND');
end
%IF suhu is panas AND kelembapan is kering THEN aktif is normal
[crispNormal3, fuzzyNormal3] = RuleDanInferensi(fuzzypanas, fuzzykering, minNormalNaik, maxNormalNaik, 'naik', 'AND');
if (crispNormal3 > minNormalTurun) || (crispNormal3 < maxNormalTurun)
    [crispNormal3, fuzzyNormal3] = RuleDanInferensi(fuzzypanas, fuzzykering, minNormalTurun, maxNormalTurun, 'turun', 'AND');
end
%IF suhu is dingin AND kelembapan is kering THEN aktif is lama
[crispLama1, fuzzyLamak1] = RuleDanInferensi(fuzzydingin, fuzzybasah, minLamaNaik, maxLamaNaik, 'naik', 'AND');
if (crispLama1 > minLamaTurun) || (crispLama1 < maxLamaTurun)
    [crispLama1, fuzzyLama1] = RuleDanInferensi(fuzzydingin, fuzzybasah, minLamaTurun, maxLamaTurun, 'turun', 'AND');
end
%IF suhu is dingin AND kelembapan is normal THEN aktif is lama
[crispLama2, fuzzyLama2] = RuleDanInferensi(fuzzydingin, fuzzysedang, minLamaNaik, maxLamaNaik, 'naik', 'AND');
if (crispLama2 > minLamaTurun) || (crispLama2 < maxLamaTurun)
    [crispLama2, fuzzyLama2] = RuleDanInferensi(fuzzydingin, fuzzysedang, minLamaTurun, maxLamaTurun, 'turun', 'AND');
end
%IF suhu is normal AND kelembapan is kering THEN aktif is lama
[crispLama3, fuzzyLama3] = RuleDanInferensi(fuzzydingin, fuzzybasah, minLamaNaik, maxLamaNaik, 'naik', 'AND');
if (crispLama3 > minLamaTurun) || (crispLama3 < maxLamaTurun)
    [crispLama3, fuzzyLama3] = RuleDanInferensi(fuzzydingin, fuzzybasah, minLamaTurun, maxLamaTurun, 'turun', 'AND');
end

disp('=========== D ===========')
disp(['Sebentar(S)=',num2str(fuzzysebentar)]);
disp(['Normal  (N)=',num2str(fuzzysedang)]);
disp(['Lama    (L)=',num2str(fuzzylama)]);

%{ 
hidupin komen ini pindah taruh keatas di T atau H sesuaikan permintaan kode
%sesuaikan kebutuhan
disp('=========== MIN ===========')
disp(['Sebentar(S)=',num2str(fuzzybasahfix,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedangfix_,'%1.1f')]);
disp(['Lama    (L)=',num2str(fuzzykeringfix,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedangfix,'%1.1f')]);

%sesuaikan kebutuhan
disp('=========== Max ===========')
disp(['Sebentar(S)=',num2str(fuzzybasahfix,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedangfix_,'%1.1f')]);
disp(['Lama    (L)=',num2str(fuzzykeringfix,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedangfix,'%1.1f')]);
%}

%Defuzzifikasi

%semua element keanggotan / MF dipanggil dengan 1 objek 
Z = ((fuzzySebentar1*crispSebentar1)+(fuzzySebentar2*crispSebentar2)+(fuzzySebentar3*crispSebentar3)+(fuzzyNormal1*crispNormal1)+(fuzzyNormal2*crispNormal2)+(fuzzyNormal3*crispNormal3)+(fuzzyLama1*crispLama1)+(fuzzyLama2*crispLama2)+(fuzzyLama3*crispLama3))/(fuzzySebentar1+fuzzySebentar2+fuzzySebentar3+fuzzyNormal1+fuzzyNormal2+fuzzyNormal3+fuzzyLama1+fuzzyLama2+fuzzyLama3);
disp(['Defuzzyfikasi[mamdani] = ',num2str(Z),' menit']);
