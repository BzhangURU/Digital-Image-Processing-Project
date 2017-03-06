clc
clear all
close all

I_threshold=imread('hw5_4_a_brain_threshold_inv.png');%0-255

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
    imshow(X_new);
    %pause;
    imwrite(X_new,strcat('hw5_4_b_ventrical_iter_',num2str(iter),'.png'));
    X=X_new;
end

figure(3);imshow(X_new);
I_detect_ventrical=X_new;
imwrite(I_detect_ventrical,'hw5_4_b_ventrical_results.png');




