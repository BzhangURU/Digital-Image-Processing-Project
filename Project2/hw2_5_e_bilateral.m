clc
clear all
close all

%I=imread('house.png');
I=imread('lena.png');
%I=I_original(1:16:end,1:16:end);

I=double(I);
I=I./255;


sigmad=3;
sigmar=100;

figure(1);imshow(I);

%Io = GaussianFilter(I, sigma);
Io = BilateralFilter (I, sigmad, sigmar);
figure(2);imshow(Io);title('Bilateral filter');

imwrite(Io,'hw2_5_e_lena_bilateral_sigmad3_sigmar100.png');