clc
clear all
close all

I_input=imread('brain.png');%0-255
figure(1);imshow(I_input);
I_input=double(I_input);

%add noise !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
I_input=I_input+30*randn(size(I_input));
I_input=min(255*ones(size(I_input)),I_input);
I_input=max(zeros(size(I_input)),I_input);



threshold=56;
I_c_threshold=I_input;
for x=1:size(I_input,1)
    for y=1:size(I_input,2)
        if I_input(x,y)<threshold
            I_c_threshold(x,y)=0;
        else I_c_threshold(x,y)=255;
        end
    end
end
figure(2);imshow(I_c_threshold);
imwrite(I_c_threshold,'hw5_4_c_brain_threshold.png');

I_c_threshold_inv=I_input;
for x=1:size(I_input,1)
    for y=1:size(I_input,2)
        if I_input(x,y)<threshold
            I_c_threshold_inv(x,y)=255;
        else I_c_threshold_inv(x,y)=0;
        end
    end
end
figure(3);imshow(I_c_threshold_inv);
imwrite(I_c_threshold_inv,'hw5_4_c_brain_threshold_inv.png');