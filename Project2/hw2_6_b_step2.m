clear all
close all

I=imread('hw2_6_b_1_original_image.png');%0-255
g=imread('hw2_6_b_2_add_noise.png');%0-255
Io=imread('hw2_6_b_3_after_Bilateral_sigmad3_sigmar100.png');%0-255
square_dis_add_noise=0;
square_dis_bilateral=0;
I=double(I);
I=I/255;
g=double(g);
g=g/255;
Io=double(Io);
Io=Io/255;


for x=1:size(I,1)
    for y=1:size(I,2)
        square_dis_add_noise=square_dis_add_noise+255*(g(x,y)-I(x,y))*255*(g(x,y)-I(x,y));
        square_dis_bilateral=square_dis_bilateral+255*(Io(x,y)-I(x,y))*255*(Io(x,y)-I(x,y));
    end
end

display('The mean square distance after adding noise is ');
square_dis_add_noise/(size(g,1)*size(g,2))

display('The mean square distance after bilateral filtering is ');
square_dis_bilateral/(size(Io,1)*size(Io,2))


%sigmar=5
% The mean square distance after adding noise is 
% ans =
%   396.5023
% The mean square distance after bilateral filtering is 
% ans =
%   369.3725


% sigma10
% The mean square distance after adding noise is 
% 
% ans =
% 
%   397.8162
% 
% The mean square distance after bilateral filtering is 
% 
% ans =
% 
%   296.1979



% sigma20
% The mean square distance after adding noise is 
% 
% ans =
% 
%   400.1122
% 
% The mean square distance after bilateral filtering is 
% 
% ans =
% 
%   157.3933



% sigma40
% The mean square distance after adding noise is 
% 
% ans =
% 
%   394.4544
% 
% The mean square distance after bilateral filtering is 
% 
% ans =
% 
%    76.9235


% sigma60
% The mean square distance after adding noise is 
% 
% ans =
% 
%   397.5267
% 
% The mean square distance after bilateral filtering is 
% 
% ans =
% 
%    85.7509




% sigma100
% The mean square distance after adding noise is 
% 
% ans =
% 
%   400.6515
% 
% The mean square distance after bilateral filtering is 
% 
% ans =
% 
%   132.3861




