clear;
clc;
%%deklarasi
f1 = 0.1;f2 = 0.2;f3 = 0.3;f4 = 0.4;f5 = 0.5;f6 = 0.6;f7 = 0.7;f8 = 0.8;f9 = 0.9;
n1 = 21;n2 = 22;n3 = 23;n4 = 24; n5 = 25; n6 = 26; n7 = 27; n8 = 28; n9 = 29; n10 = 30;
h1 = 30; h2 = 35; h3 = 40; h4 = 45; h5 = 50; h6 = 55; h7 = 60; h8 = 65; h9 = 70; h10= 75; 
%%
%temperatur suhu udara
x1=0:0.1:50;%range/rentang dalam skala derajat
crisp1=35;
max=18; min=5; [fuzzydingin] = Fuzzifikasi(crisp1,max,min,'function_2');
max=28; min=18; [fuzzysedang_] = Fuzzifikasi(crisp1,max,min,'function_2'); %panggil function Fuzzifikasi
max=50; min=30; [fuzzypanas] = Fuzzifikasi(crisp1,max,min,'function_1');   %fungsi fixed bilangan pecahan
%%
fuzzydingin = 0;
if (crisp1<=n1) fuzzydingin = f8;elseif (crisp1==n2) fuzzydingin = f5;elseif (crisp1==n3) fuzzydingin = f4;elseif (crisp1==n4) fuzzydingin = f3;elseif (crisp1==n5) fuzzydingin = f3;elseif (crisp1==n6) fuzzydingin = f3;elseif (crisp1==n7) fuzzydingin = f2;elseif (crisp1==n8) fuzzydingin = f2;elseif (crisp1>=n9) fuzzydingin = f2;end
fuzzysedang_ = 0;
if (crisp1<=n1) fuzzysedang_ = f2;elseif (crisp1==n2) fuzzysedang_ = f3;elseif (crisp1==n3) fuzzysedang_ = f6;elseif (crisp1==n4) fuzzysedang_ = f8;elseif (crisp1==n5) fuzzysedang_ = f8;elseif (crisp1==n6) fuzzysedang_ = f6;elseif (crisp1==n7) fuzzysedang_ = f4;elseif (crisp1==n8) fuzzysedang_ = f3;elseif (crisp1>=n9) fuzzysedang_ = f2;end
fuzzypanas = 0;
if (crisp1<=n1) fuzzypanas = f2;elseif (crisp1==n2) fuzzypanas = f2;elseif (crisp1==n3) fuzzypanas = f2;elseif (crisp1==n4) fuzzypanas = f3;elseif (crisp1==n5) fuzzypanas = f4;elseif (crisp1==n6) fuzzypanas = f5;elseif (crisp1==n7) fuzzypanas = f6;elseif (crisp1==n8) fuzzypanas = f7;elseif (crisp1>=n9) fuzzypanas = f8;end
%%
disp('=============T============');
disp(['Dingin  (D)=',num2str(fuzzydingin,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]);
disp(['Panas   (P)=',num2str(fuzzypanas,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]);

%%
x=0:1:100;%range/rentang dalam skala persen
crisp2=45;  
max=30; min=20; [fuzzybasah] = Fuzzifikasi(crisp2,max,min,'function_2');
max=60; min=35; [fuzzysedang] = Fuzzifikasi(crisp2,max,min,'function_1');
max=80; min=60; [fuzzykering] = Fuzzifikasi(crisp2,max,min,'function_1');

%fungsi fixed bilangan pecahan
%%
fuzzybasah = 0;
if (crisp2<=h1) fuzzybasah = f1;elseif (crisp2==h2) fuzzybasah = f2;elseif (crisp2==h3) fuzzybasah = f4;elseif (crisp2==h4) fuzzybasah = f4;elseif (crisp2==h5) fuzzybasah = f6;elseif (crisp2==h6) fuzzybasah = f6;elseif (crisp2==h7) fuzzybasah = f8;elseif (crisp2==h8) fuzzybasah = f2;elseif (crisp2>=h9) fuzzybasah = f8;elseif (crisp2>=h10) fuzzybasah = f8;end
fuzzysedang = 0;
if (crisp2<=h1) fuzzysedang = f2;elseif (crisp2==h2) fuzzysedang = f4;elseif (crisp2==h3) fuzzysedang = f8;elseif (crisp2==h4) fuzzysedang = f8;elseif (crisp2==h5) fuzzysedang = f8;elseif (crisp2==h6) fuzzysedang = f8;elseif (crisp2==h7) fuzzysedang = f7;elseif (crisp2==h8) fuzzysedang = f4;elseif (crisp2==h9) fuzzysedang = f2;elseif (crisp2>=h10) fuzzysedang = f2;end
fuzzykering = 0;
if (crisp2<=h1) fuzzykering = f8;elseif (crisp2==h2) fuzzykering = f8;elseif (crisp2==h3) fuzzykering = f4;elseif (crisp2==h4) fuzzykering = f4;elseif (crisp2==h5) fuzzykering = f4;elseif (crisp2==h6) fuzzykering = f4;elseif (crisp2==h7) fuzzykering = f2;elseif (crisp2==h8) fuzzykering = f2;elseif (crisp2==h9) fuzzykering = f2;elseif (crisp2>=h10) fuzzykering = f1;end

%%
disp('=============H============');
disp(['Basah   (B)=',num2str(fuzzybasah,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);
disp(['Kering  (K)=',num2str(fuzzykering,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);

%%
disp('=========== MIN ===========')
if (fuzzydingin<fuzzybasah);
disp(['Sebentar(S)=',num2str(fuzzydingin,'%1.1f')]);
elseif (fuzzybasah<fuzzydingin);
disp(['Sebentar(S)=',num2str(fuzzybasah,'%1.1f')]); 
elseif (fuzzybasah==fuzzydingin);
disp(['Sebentar(S)=',num2str(fuzzybasah,'%1.1f')]);
end
if (fuzzysedang_<fuzzysedang);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]);
elseif (fuzzysedang<fuzzysedang_);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]); 
elseif (fuzzysedang==fuzzysedang_);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);
end
if (fuzzykering<fuzzypanas);
disp(['Lama    (L)=',num2str(fuzzykering,'%1.1f')]);
elseif (fuzzypanas<fuzzykering);
disp(['Lama    (L)=',num2str(fuzzypanas,'%1.1f')]); 
elseif (fuzzypanas==fuzzykering);
disp(['Lama    (L)=',num2str(fuzzypanas,'%1.1f')]); 
end
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);
%%
crisp3=360;
max=70; min=30; [fuzzysebentar] = Fuzzifikasi(crisp3,max,min,'function_2');
%max=155; min=120; [fuzzysedang] = Fuzzifikasi(crisp3,max,min,'function_2');
max=360; min=180; [fuzzylama] = Fuzzifikasi(crisp3,max,min,'function_2');

disp('=========== Max ===========')
if (fuzzydingin<fuzzybasah);
disp(['Sebentar(S)=',num2str(fuzzydingin,'%1.1f')]);
elseif (fuzzybasah<fuzzydingin);
disp(['Sebentar(S)=',num2str(fuzzybasah,'%1.1f')]); 
elseif (fuzzybasah==fuzzydingin);
disp(['Sebentar(S)=',num2str(fuzzybasah,'%1.1f')]); 
end
if (fuzzysedang_<fuzzysedang);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);
elseif (fuzzysedang_>fuzzysedang);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]); 
elseif (fuzzysedang==fuzzysedang);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]); 
end
if (fuzzykering<fuzzypanas);
disp(['Lama    (L)=',num2str(fuzzykering,'%1.1f')]);
elseif (fuzzypanas<fuzzykering);
disp(['Lama    (L)=',num2str(fuzzypanas,'%1.1f')]); 
elseif (fuzzypanas==fuzzykering);
disp(['Lama    (L)=',num2str(fuzzypanas,'%1.1f')]); 
end
%%
minSebentarNaik = 30; maxSebentarNaik = 25;
minSebentarTurun = 25; maxSebentarTurun = 25;
minNormalNaik = 15; maxNormalNaik = 25;
minNormalTurun = 25; maxNormalTurun = 20;
minLamaNaik = 20; maxLamaNaik = 25;
minLamaTurun = 25; maxLamaTurun = 30;
%%
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
%%
%Defuzzifikasi
Z = ((fuzzySebentar1*crispSebentar1)+(fuzzySebentar2*crispSebentar2)+(fuzzySebentar3*crispSebentar3)+(fuzzyNormal1*crispNormal1)+(fuzzyNormal2*crispNormal2)+(fuzzyNormal3*crispNormal3)+(fuzzyLama1*crispLama1)+(fuzzyLama2*crispLama2)+(fuzzyLama3*crispLama3))/(fuzzySebentar1+fuzzySebentar2+fuzzySebentar3+fuzzyNormal1+fuzzyNormal2+fuzzyNormal3+fuzzyLama1+fuzzyLama2+fuzzyLama3);
disp(['Defuzzyfikasi[mamdani] = ',num2str(Z),' Menit']);