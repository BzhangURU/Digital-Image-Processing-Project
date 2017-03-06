clc
clear all
close all


I=imread('house.png');%0-255
I=double(I);
g = I+20*randn(size(I));
max_255=255*ones(size(I));
min_0=zeros(size(I));

g=min(g,max_255);
g=max(g,min_0);


figure(1);imshow(I,[0,255]);title('original image');
imwrite(I/255,'hw2_6_b_1_original_image.png');
figure(2);imshow(g,[0,255]);title('original image add noise');
imwrite(g/255,'hw2_6_b_2_add_noise.png');
g=double(g);
g=g./255;
sigmad=3;
sigmar=100;
%Io = func_GaussianFilter_5_a(g, sigma);
Io = BilateralFilter (g, sigmad, sigmar);
figure(3);imshow(Io);title('after Bilateral filter');
imwrite(Io,'hw2_6_b_3_after_Bilateral_sigmad3_sigmar100.png');