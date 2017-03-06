clear all
close all

I=imread('fingerprint.png');%0-255



[Io, t] = func_otsu(I);
figure(1);imshow(I);title('original image');
figure(3);imshow(Io);title('image after otsu');
imwrite(Io,'hw2_4_b_1image_after_otsu.png');
