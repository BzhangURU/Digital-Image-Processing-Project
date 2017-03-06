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
figure(2);imshow(I_input,[0,255]);
imwrite(I_input./255,'hw5_4_c_new_way_brain_noisy_input.png');


% B=[1 1 1; 1 1 1;1 1 1];
% I_e=func_erosion_gray_morphology(I_input,B);
% figure(3);imshow(I_e,[0,255]);
% I_ed=func_dilation_gray_morphology(I_e,B);
% figure(4);imshow(I_ed,[0,255]);
% I_edd=func_dilation_gray_morphology(I_ed,B);
% figure(5);imshow(I_edd,[0,255]);
% I_edde=func_erosion_gray_morphology(I_edd,B);
% 
% figure(6);imshow(I_edde,[0,255]);
% imwrite(I_edde./255,'hw5_4_c_new_way_brain_for_threshold.png');
% threshold=33;
% I_c_threshold=I_edde;
% for x=1:size(I_edde,1)
%     for y=1:size(I_edde,2)
%         if I_edde(x,y)<threshold
%             I_c_threshold(x,y)=0;
%         else I_c_threshold(x,y)=255;
%         end
%     end
% end
% figure(7);imshow(I_c_threshold,[0,255]);
% imwrite(I_c_threshold./255,'hw5_4_c_new_way_brain_threshold.png');
% 
% I_c_threshold_inv=I_edde;
% for x=1:size(I_edde,1)
%     for y=1:size(I_edde,2)
%         if I_edde(x,y)<threshold
%             I_c_threshold_inv(x,y)=255;
%         else I_c_threshold_inv(x,y)=0;
%         end
%     end
% end
% figure(8);imshow(I_c_threshold_inv,[0,255]);
% imwrite(I_c_threshold_inv./255,'hw5_4_c_new_way_brain_threshold_inv.png');