clear;
clc;
f1 = 0.1;f2 = 0.2;f3 = 0.3;f4 = 0.4;f5 = 0.5;f6 = 0.6;f7 = 0.7;f8 = 0.8;f9 = 0.9;
n1 = 21;n2 = 22;n3 = 23;n4 = 24; n5 = 25; n6 = 26; n7 = 27; n8 = 28; n9 = 29; n10 = 30;
h1 = 30; h2 = 35; h3 = 40; h4 = 45; h5 = 50; h6 = 55; h7 = 60; h8 = 65; h9 = 70; h10= 75; 
%%
%temperatur suhu udara
x1=0:0.1:50;%range/rentang dalam skala derajat
crisp1=35;
max=18; min=5; [fuzzydingin] = Fuzzifikasi(crisp1,max,min,'function_2');
max=28; min=15; [fuzzysedang_] = Fuzzifikasi(crisp1,max,min,'function_2'); %panggil function Fuzzifikasi
max=50; min=30; [fuzzypanas] = Fuzzifikasi(crisp1,max,min,'function_1');

%fungsi fixed bilangan pecahan
%%
fuzzydingin = 0;
if (crisp1<=n1) fuzzydingin = f8;elseif (crisp1==n2) fuzzydingin = f5;elseif (crisp1==n3) fuzzydingin = f4;elseif (crisp1==n4) fuzzydingin = f3;elseif (crisp1==n5) fuzzydingin = f3;elseif (crisp1==n6) fuzzydingin = f3;elseif (crisp1==n7) fuzzydingin = f2;elseif (crisp1==n8) fuzzydingin = f2;elseif (crisp1>=n9) fuzzydingin = f1;end
fuzzysedang_ = 0;
if (crisp1<=n1) fuzzysedang_ = f2;elseif (crisp1==n2) fuzzysedang_ = f3;elseif (crisp1==n3) fuzzysedang_ = f6;elseif (crisp1==n4) fuzzysedang_ = f8;elseif (crisp1==n5) fuzzysedang_ = f8;elseif (crisp1==n6) fuzzysedang_ = f6;elseif (crisp1==n7) fuzzysedang_ = f4;elseif (crisp1==n8) fuzzysedang_ = f3;elseif (crisp1>=n9) fuzzysedang_ = f2;end
fuzzypanas = 0;
if (crisp1<=n1) fuzzypanas = f1;elseif (crisp1==n2) fuzzypanas = f2;elseif (crisp1==n3) fuzzypanas = f2;elseif (crisp1==n4) fuzzypanas = f3;elseif (crisp1==n5) fuzzypanas = f4;elseif (crisp1==n6) fuzzypanas = f5;elseif (crisp1==n7) fuzzypanas = f6;elseif (crisp1==n8) fuzzypanas = f7;elseif (crisp1>=n9) fuzzypanas = f8;end
%%
disp('=============T============');
disp(['Panas   (P)=',num2str(fuzzypanas,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang_,'%1.1f')]);

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
disp(['Kering  (K)=',num2str(fuzzykering,'%1.1f')]);
disp(['Normal  (N)=',num2str(fuzzysedang,'%1.1f')]);