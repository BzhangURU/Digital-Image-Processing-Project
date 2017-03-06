clear all
close all

I=imread('lena.png');

I=double(I);
I=I./255;

Io = AdaptiveEqualize (I);
figure(1);imshow(I);title('original image');
figure(2);imshow(Io);title('image after adaptive equalization');
imwrite(Io,'hw2_4_a_image after adaptive equalization.png');


