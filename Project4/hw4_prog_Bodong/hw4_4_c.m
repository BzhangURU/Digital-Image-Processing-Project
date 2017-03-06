clc
clear all
close all

I=imread('boat.png');%0-255
[fingerprint_gblur,H_blurdegradation] = BlurDegradation(I);
fingerprint_gblur=fingerprint_gblur/255;
fingerprint_gblur=min(fingerprint_gblur,ones(size(fingerprint_gblur)));
fingerprint_gblur=max(fingerprint_gblur,zeros(size(fingerprint_gblur)));


imshow(fingerprint_gblur);
imwrite(fingerprint_gblur,'hw4_4_c_boat_blur.png');

%K=1;
flag=1;


for K=0.1:0.1:1
%for K=0.001:0.003:0.03
%for K=0.016:0.001:0.022
%for K=0.001:0.001:0.01
%for K=0.003:0.0001:0.005
K
save_MSE_wiener(1,flag)=K;




Io= WienerReject(fingerprint_gblur,H_blurdegradation,K);


Io_real=real(Io);
Io_real=min(Io_real,ones(size(Io_real)));
Io_real=max(Io_real,zeros(size(Io_real)));

I_01=double(I)/255;


square_dis_blur=0;
square_dis_wiener=0;
for x=1:size(Io_real,1)
    for y=1:size(Io_real,2)
        square_dis_blur=square_dis_blur+255*(fingerprint_gblur(x,y)-I_01(x,y))*255*(fingerprint_gblur(x,y)-I_01(x,y));%compare to no-noise image, not noisy image
        square_dis_wiener=square_dis_wiener+255*(Io_real(x,y)-I_01(x,y))*255*(Io_real(x,y)-I_01(x,y));
    end
end

figure(2);imshow(Io_real);title('image after wiener filtering');
imwrite(Io_real,strcat('hw4_4_c_boat_after_wiener_K',num2str(K),'.png'));




display('The mean square distance after blur is ');
%MSE=square_dis_noise/(size(I,1)*size(I,2))
MSE_blur=square_dis_blur/(size(Io_real,1)*size(Io_real,2))


display('The mean square distance after wiener filtering is ');
%MSE=square_dis_noise/(size(I,1)*size(I,2))
MSE_wiener=square_dis_wiener/(size(Io_real,1)*size(Io_real,2))



% [Io, t] = func_otsu(I);
% figure(1);imshow(I);title('original image');
% figure(3);imshow(Io);title('image after otsu');
% imwrite(Io,'hw2_4_b_1image_after_otsu.png');

save_MSE_wiener(2,flag)=MSE_blur;
save_MSE_wiener(3,flag)=MSE_wiener;
flag=flag+1;
save('save_MSE_wiener.mat','save_MSE_wiener');
end

plot(save_MSE_wiener(1,:),save_MSE_wiener(2,:),':ok',save_MSE_wiener(1,:),save_MSE_wiener(3,:),'--xr');
legend('MSE of blur degradation','MSE after wiener');
%axis([0,4,0,1]);
xlabel('K');ylabel('MSE');
title('boat');