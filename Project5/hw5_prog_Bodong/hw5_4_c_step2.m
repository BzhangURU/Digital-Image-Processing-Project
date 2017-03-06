clc
clear all
close all

I_threshold=imread('hw5_4_c_brain_threshold_inv.png');%0-255

I_threshold=double(I_threshold)./255;

figure(1);imshow(I_threshold);
X=zeros(size(I_threshold));
X(76,132)=1;
figure(2);imshow(X);
X_new=zeros(size(I_threshold));
B=[1 1 1;1 1 1;1 1 1];
iter=0;
while 1
    iter=iter+1;
    %X_new=X;
    X_new=func_dilation_morphology(X,B,1);
    X_new=X_new.*I_threshold;
    if isequal(X_new,X)
        break;
    end
%     imshow(X_new);
%     %pause;
%     imwrite(X_new,strcat('hw5_4_c_ventrical_iter_',num2str(iter),'.png'));
    X=X_new;
end

figure(3);imshow(X_new);
I_detect_ventrical=X_new;
imwrite(I_detect_ventrical,'hw5_4_c_ventrical_results.png');
B4connect=[0 1 0;1 1 1;0 1 0];
I_e=func_erosion_morphology(I_detect_ventrical,B4connect,1);
figure(4);imshow(I_e);
imwrite(I_e,'hw5_4_c_denoise_e_results.png');

I_ed=func_dilation_morphology(I_e,B4connect,1);
figure(5);imshow(I_ed);
imwrite(I_ed,'hw5_4_c_denoise_ed_results.png');

I_edd=func_dilation_morphology(I_ed,B4connect,1);
figure(6);imshow(I_edd);
imwrite(I_edd,'hw5_4_c_denoise_edd_results.png');

I_edde=func_erosion_morphology(I_edd,B4connect,1);

figure(7);imshow(I_edde);

imwrite(I_edde,'hw5_4_c_denoise_edde_results.png');





