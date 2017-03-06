clc
clear all
close all

I=imread('house.png');
%I=imread('houseNoisy1.pgm');
I=double(double(I)./255);
W=0.1*size(I,2);
Do=0.3*size(I,2);
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
    imwrite(original_frequency,'hw3_5_b_1freq_before_Butterworth.png');
    
    
    
    
    
    center_u=round(size(I_fre_shift,1)/2)-1;
    center_v=round(size(I_fre_shift,1)/2);
    
    I_fre_shift_filtered=zeros(size(I_fre_shift));
    for u=1:size(I_fre_shift,1)
        for v=1:size(I_fre_shift,2)
            if u==center_u&&v==center_v
                I_fre_shift(u,v)=0;
            else
                D=sqrt((u-center_u)*(u-center_u)+(v-center_v)*(v-center_v));
                I_fre_shift_filtered(u,v)=I_fre_shift(u,v)*1/(1+(D*W/(D*D-Do*Do))^(2*n));
            end
        end
    end
    
    
    
    
    max_out=max(max(abs(I_fre_shift_filtered)));
    output_frequency=zeros(size(I_fre_shift_filtered,1),size(I_fre_shift_filtered,2));
    for u=1:size(I_fre_shift,1)
        for v=1:size(I_fre_shift,2)
            output_frequency(u,v)=log10(abs(I_fre_shift_filtered(u,v))+1)/log10(max_out+1);
        end
    end
    figure(2);imshow(output_frequency);
    title('image in frequency domain after Butterworth BandReject Filter');
    imwrite(output_frequency,'hw3_5_b_2freq_after_Butterworth.png');
    
    

    I_fre_filtered=ifftshift(I_fre_shift_filtered);
    Ioo=ifft2(I_fre_filtered);

    max_Ioo=max(max(abs(Ioo)));
    Io=abs(Ioo)/max_Ioo;




figure(3);imshow(I);title('original image');
figure(4);imshow(Io);title('output image');
imwrite(Io,'hw3_5_b_3output_image_after_Butterworth.png');
%figure(3);imshow(Io);



