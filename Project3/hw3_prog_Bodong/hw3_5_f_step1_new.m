clc
clear all
close all
flag=1;
%for W=0.01:0.01:0.3
%for W=0.01:0.001:0.03
for W=0.21
W
save_W(1,flag)=W;

I_house=imread('house.png');
I_house=double(I_house)./255;
I=imread('houseNoisy2.pgm');%periodic noise
I=double(double(I)./255);

W=W*size(I,2);
%W=0.06*size(I,2);



Do=sqrt((187-(round(size(I,1)/2)+1))^2+(71-(round(size(I,1)/2)+1))^2);
%The center is at 129,129
n=2;


%Io = ButterworthBandReject (I,Do,W,n);
    if(ndims(I)==3)
        I=rgb2gray(I);
    end
    if max(max(I))>1
        display('Intensity should not exceed 1');
        pause;
    end
    
    if min(min(I))<0
        display('Intensity should not be smaller than 0');
        pause;
    end
    I_fre=fft2(I);
    I_fre_shift=fftshift(I_fre);
    
    
    
    
    max_original=max(max(abs(I_fre_shift)));
    original_frequency=zeros(size(I_fre_shift,1),size(I_fre_shift,2));
    for u=1:size(I_fre_shift,1)
        for v=1:size(I_fre_shift,2)
            original_frequency(u,v)=log10(abs(I_fre_shift(u,v))+1)/log10(max_original+1);
        end
    end
    
    
    figure(1);imshow(original_frequency);
    title('image in frequency domain before Butterworth BandReject Filter');
    imwrite(original_frequency,'hw3_5_f_noisy2_after_filter_1time_original_frequency.png');
%     max(max(original_frequency(1:end*2/5,end*3/5:end)))
%     max(max(original_frequency(end*3/5:end,1:end*2/5)))
%     max(max(original_frequency(1:end*2/5,1:end*2/5)))
    
    
    
    
    
    
    
    center_u=round(size(I_fre_shift,1)/2)+1;
    center_v=round(size(I_fre_shift,1)/2)+1;
    
    I_fre_shift_filtered=zeros(size(I_fre_shift));
    for u=1:size(I_fre_shift,1)
        for v=1:size(I_fre_shift,2)
            D=sqrt((u-center_u)*(u-center_u)+(v-center_v)*(v-center_v));
            if D==Do
                I_fre_shift(u,v)=0;
            else
                
                I_fre_shift_filtered(u,v)=I_fre_shift(u,v)*1/(1+(D*W/(D*D-Do*Do))^(2*n));
            end
        end
    end
    freq_image_noisy2_after_first_step=I_fre_shift_filtered;
    save('freq_image_noisy2_after_first_step.mat','freq_image_noisy2_after_first_step');
    
    
    max_out=max(max(abs(I_fre_shift_filtered)));
    output_frequency=zeros(size(I_fre_shift_filtered,1),size(I_fre_shift_filtered,2));
    for u=1:size(I_fre_shift,1)
        for v=1:size(I_fre_shift,2)
            output_frequency(u,v)=log10(abs(I_fre_shift_filtered(u,v))+1)/log10(max_out+1);
        end
    end
    figure(2);imshow(output_frequency);
    title('image in frequency domain after Butterworth BandReject Filter');
    imwrite(output_frequency,'hw3_5_f_noisy2_after_filter_1time_output_frequency.png');
    
    

    I_fre_filtered=ifftshift(I_fre_shift_filtered);
    Ioo=ifft2(I_fre_filtered);
    
    
    %save('image_noisy2_first_step.dat','Ioo');
    
    max_Ioo=max(max(abs(Ioo)));
    Io=abs(Ioo)/max_Ioo;

    Io_way2=real(Ioo);
    Io_way2=min(Io_way2,ones(size(Io_way2)));
    Io_way2=max(Io_way2,zeros(size(Io_way2)));

figure(3);imshow(I);title('original image');
imwrite(I,'hw3_5_f_noisy2_after_filter_1time_original_image.png');
figure(4);imshow(Io_way2);title('output image');

imwrite(Io_way2,'hw3_5_f_noisy2_after_filter_1time.png');






square_dis_noise=0;
square_dis_noise_way2=0;
for x=1:size(I,1)
    for y=1:size(I,2)
        square_dis_noise=square_dis_noise+255*(Io(x,y)-I_house(x,y))*255*(Io(x,y)-I_house(x,y));%compare to no-noise image, not noisy image
        square_dis_noise_way2=square_dis_noise_way2+255*(Io_way2(x,y)-I_house(x,y))*255*(Io_way2(x,y)-I_house(x,y));
    end
end

display('The mean square distance after adding noise is ');
%MSE=square_dis_noise/(size(I,1)*size(I,2))
MSE_way2=square_dis_noise_way2/(size(I,1)*size(I,2))
save_W(2,flag)=MSE_way2;
flag=flag+1;

end