clc
clear all
close all


I=imread('house.png');
I=double(I);
I_noisy=imread('houseNoisy2.pgm');
I_noisy=double(I_noisy);

if max(max(I))<=1
    display('Intensity should exceed 1');
    pause;
end


square_dis_noise=0;



for x=1:size(I,1)
    for y=1:size(I,2)
        square_dis_noise=square_dis_noise+(I_noisy(x,y)-I(x,y))*(I_noisy(x,y)-I(x,y));
    end
end

display('The mean square distance of noisy2 is ');
MSE=square_dis_noise/(size(I,1)*size(I,2))