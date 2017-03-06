clear all
close all


I=imread('fingerprint.png');%0-255
I=double(I);
I=I./255;
I = AdaptiveEqualize (I);
I_middle=I*255;
[Io, t] = func_otsu(I_middle);
figure(1);imshow(I);title('original image');
figure(3);imshow(Io);title('image after otsu');
imwrite(Io,'hw2_4_b_2image_after_otsu.png');