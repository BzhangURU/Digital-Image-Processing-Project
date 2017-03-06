clear all
close all

%I=imread('house.png');
I=imread('lena.png');
%Io_Gaussian=imread('hw2_5_c_lena_Gaussian_sigma3.png');
Io_Bilateral=imread('hw2_5_e_lena_bilateral_sigmad3_sigmar100.png');
%I=I_original(1:16:end,1:16:end);

I=double(I);
I=I./255;
% Io_Gaussian=double(Io_Gaussian);
% Io_Gaussian=Io_Gaussian./255;

Io_Bilateral=double(Io_Bilateral);
Io_Bilateral=Io_Bilateral./255;



figure(1);imshow(I);

%Io = GaussianFilter(I, sigma);

%Io_Gaussian_dif = abs(Io_Gaussian-I);
Io_Bilateral_dif = abs(Io_Bilateral-I);

%figure(1);imshow(Io_Gaussian_dif);title('difference between after Gaussian filter and original image');
figure(2);imshow(Io_Bilateral_dif);title('difference between after Bilateral filter and original image');

%imwrite(Io_Gaussian_dif,'hw2_5_d_lena_dif_Gaussian.png');
imwrite(Io_Bilateral_dif,'hw2_5_e_lena_dif_Bilateral_sigmad3_sigmar100.png');

%max_gaussian=max(max(Io_Gaussian_dif))
max_bilateral=max(max(Io_Bilateral_dif))

%Io_Gaussian_dif_normalize=Io_Gaussian_dif/max_gaussian;
Io_Bilateral_dif_normalize=Io_Bilateral_dif/max_bilateral;

%figure(3);imshow(Io_Gaussian_dif_normalize);title('normalized difference between after Gaussian filter and original image');
figure(3);imshow(Io_Bilateral_dif_normalize);title('normalized difference between after Bilateral filter and original image');

%imwrite(Io_Gaussian_dif_normalize,'hw2_5_d_lena_normalized_dif_Gaussian.png');
imwrite(Io_Bilateral_dif_normalize,'hw2_5_e_lena_normalized_dif_Bilateral_sigmad3_sigmar100.png');
