function Io = GaussianFilter(I, sigma)
%
    





    if max(max(I))>1
        display('Intensity should not exceed 1');
        pause;
    end
    
    if min(min(I))<0
        display('Intensity should not be smaller than 0');
        pause;
    end
    
    Io=zeros(size(I));
    [w,h]=size(I);
    k_d=zeros(size(I));
    for x=1:w
        for y=1:h
            
            for sig1=max(1,x-3*sigma):min(x+3*sigma,w)
                for sig2=max(1,y-3*sigma):min(y+3*sigma,h)
                    k_d(x,y)=k_d(x,y)+func_gaussian_c(x,y,sig1,sig2,sigma);
                end
            end
        end  
    end
    
    
    for x=1:w
        for y=1:h
            
            for sig1=max(1,x-3*sigma):min(x+3*sigma,w)
                for sig2=max(1,y-3*sigma):min(y+3*sigma,h)
                    %k_d(x,y)=k_d(x,y)+func_gaussian_c(x1,y1,x2,y2,sigma);
                    Io(x,y)=Io(x,y)+(1/k_d(x,y))*I(sig1,sig2)*func_gaussian_c(x,y,sig1,sig2,sigma);
                end
            end
        end  
    end
    
    
 
    
    


end