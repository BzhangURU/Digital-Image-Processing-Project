clear all
close all

I=imread('hw2_6_a_1_original_image.png');%0-255
g=imread('hw2_6_a_2_add_noise.png');%0-255
Io=imread('hw2_6_a_3_after_gaussian.png');%0-255
square_dis_add_noise=0;
square_dis_gaussian=0;
I=double(I);
I=I/255;
g=double(g);
g=g/255;
Io=double(Io);
Io=Io/255;


for x=1:size(I,1)
    for y=1:size(I,2)
        square_dis_add_noise=square_dis_add_noise+255*(g(x,y)-I(x,y))*255*(g(x,y)-I(x,y));
        square_dis_gaussian=square_dis_gaussian+255*(Io(x,y)-I(x,y))*255*(Io(x,y)-I(x,y));
    end
end

display('The mean square distance after adding noise is ');
square_dis_add_noise/(size(g,1)*size(g,2))

display('The mean square distance after gaussian filtering is ');
square_dis_gaussian/(size(Io,1)*size(Io,2))



% The mean square distance after adding noise is 
% 
% ans =
% 
%   397.6034
% 
% The mean square distance after gaussian filtering is 
% 
% ans =
% 
%   214.8330






