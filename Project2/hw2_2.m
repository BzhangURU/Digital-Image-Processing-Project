clc
clear all
close all

I=imread('house.png');
%I=I_original(1:16:end,1:16:end);

I=double(I);
I=I./255;




figure(1);imshow(I);
%I=double(I);
%I=I./255;
sigma=1;
for i=1:1
    I = func_GaussianFilter_2(I, sigma);
end



figure(2);imshow(I);title('Gaussian lowpass filter');