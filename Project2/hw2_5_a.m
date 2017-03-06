clc
clear all
close all

I=imread('boat.png');
%I=I_original(1:16:end,1:16:end);

I=double(I);
I=I./255;




figure(1);imshow(I);
%I=double(I);
%I=I./255;
sigma=20;
Io = func_GaussianFilter_5_a(I, sigma);




figure(2);imshow(Io);title('Gaussian lowpass filter');
