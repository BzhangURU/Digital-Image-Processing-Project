function output= func_gaussian_s_range(f,g,sigma)
%The c function in Bilateral Filtering for Gray and Color Images(C Tomasi, R Manduchi)

    f=double(f);
    g=double(g);
    sigma=double(sigma);
    output=exp(-0.5*(((f-g)*(f-g))/(sigma*sigma)));

end