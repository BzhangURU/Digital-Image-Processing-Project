%Bi-segmentation(choose k which realize largest variance to total mean)
function [It, t] = func_otsu(I)
%I is from 0 to 255

f=I(:);%change to one column
f=double(f);
mg = mean(f);
vg = var(f);
n = length(f);
for k = 1:255
    i1 = find(f<k);
    i2 = find(f>=k);
    n1 = length(i1);
    n2 = length(i2);
    m1 = mean(f(i1));
    m2 = mean(f(i2));
    vb(k) = (n1/n)*(m1-mg)^2 + (n2/n)*(m2-mg)^2;
end;
vb=vb/vg;
[d t] = max(vb);
It = I>t;
figure(2);
subplot(2,1,1);hist(f,256);
subplot(2,1,2);plot(vb,'r');
end