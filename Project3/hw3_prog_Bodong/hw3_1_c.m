clc
clear all
close all

% t=0:0.43:0.43*20;
% y=sin(2*pi*t);
% 
% tt=0:0.01:0.43*20;
% yt=sin(2*pi*tt);
% stem(t,y);
% % hold on;
% % plot(tt,yt);




% t=0:0.666666667:0.666666667*20;
% y=sin(2*pi*t);
% tt=0:0.01:0.666666667*20;
% yt=sin(2*pi*tt);
% stem(t,y);
% hold on;
% plot(tt,yt);



% t=0:0.666666667:0.666666667*20;
% y=sin(2*pi*t);
% tt=0:0.0001:0.666666667*20;
% yt=-sin(pi*tt);
% stem(t,y);
% hold on;
% plot(tt,yt);



t=0:0.5:0.5*20;
y=sin(2*pi*t);
% tt=0:0.0001:0.5*20;
% yt=-sin(pi*tt);
stem(t,y);
axis([0,10,-1,1])
