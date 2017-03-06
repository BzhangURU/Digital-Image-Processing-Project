function Io = BilateralFilter (I, sigmad, sigmar)
%Intensity of I is between 0 and 1
%sigmar is measured in intensities range from 0 to 255

    sigmar=double(sigmar);
    sigmar=sigmar/255;%intensity
    
    %sigmad is geometric distance

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
    k=zeros(size(I));
    for x=1:w
        for y=1:h
            
            for sig1=max(1,x-3*sigmad):min(x+3*sigmad,w)
                for sig2=max(1,y-3*sigmad):min(y+3*sigmad,h)
                    k(x,y)=k(x,y)+func_gaussian_c(x,y,sig1,sig2,sigmad)*func_gaussian_s_range(I(x,y),I(sig1,sig2),sigmar);
                end
            end
        end  
    end
    
    
    for x=1:w
        for y=1:h
            
            for sig1=max(1,x-3*sigmad):min(x+3*sigmad,w)
                for sig2=max(1,y-3*sigmad):min(y+3*sigmad,h)
                    %k_d(x,y)=k_d(x,y)+func_gaussian_c(x1,y1,x2,y2,sigma);
                    Io(x,y)=Io(x,y)+(1/k(x,y))*I(sig1,sig2)*func_gaussian_c(x,y,sig1,sig2,sigmad)*func_gaussian_s_range(I(x,y),I(sig1,sig2),sigmar);
                end
            end
        end  
    end
    
    
 
    
    


end