function output= func_gaussian_c(x1,y1,x2,y2,sigma)
%The c function in Bilateral Filtering for Gray and Color Images(C Tomasi, R Manduchi)

    x1=double(x1);
    y1=double(y1);
    x2=double(x2);
    y2=double(y2);
    sigma=double(sigma);
    output=exp(-0.5*(((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))/(sigma*sigma)));

end

