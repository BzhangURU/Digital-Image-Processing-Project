clc
clear all
close all

I=imread('lena.png');
%I=I_original(1:16:end,1:16:end);

I=double(I);
I=I./255;


sigma=3;

figure(1);imshow(I);

Io = GaussianFilter(I, sigma);
figure(2);imshow(Io);title('Gaussian filter');


imwrite(Io,'hw2_5_a_lena_sigma3.png');

