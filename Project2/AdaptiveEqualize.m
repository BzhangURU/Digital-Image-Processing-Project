function Io = AdaptiveEqualize (I)
    if max(max(I))>1
        display('Intensity should not exceed 1');
        pause;
    end
    
    if min(min(I))<0
        display('Intensity should not be smaller than 0');
        pause;
    end
    
    I=255*I;
    
    Io=zeros(size(I));
    [w,h]=size(I);
    
    
    for i=1:floor(double(w/32))
        for j=1:floor(double(h/32))
            
            block_mean=0;
            variance=0;
            count=0;
            for x=1+(i-1)*32:min(32+(i-1)*32,w)
                for y=1+(j-1)*32:min(32+(j-1)*32,h)
                    block_mean=block_mean+double(I(x,y));
                    count=count+1;
                    %variance=variance+;
                end
            end
            block_mean=block_mean/count;
            for x=1+(i-1)*32:min(32+(i-1)*32,w)
                for y=1+(j-1)*32:min(32+(j-1)*32,h)
                    variance=variance+(I(x,y)-block_mean)*(I(x,y)-block_mean);
                end
            end
            variance=variance/count;
            sigma=sqrt(variance);
            if sigma==0
                for x=1+(i-1)*32:min(32+(i-1)*32,w)
                    for y=1+(j-1)*32:min(32+(j-1)*32,h)
                        Io(x,y)=I(x,y)-block_mean+128;
                    end
                end
            else
                for x=1+(i-1)*32:min(32+(i-1)*32,w)
                    for y=1+(j-1)*32:min(32+(j-1)*32,h)
                        if ((I(x,y)-block_mean)/sigma)*50+128>255
                            Io(x,y)=255;
                        elseif ((I(x,y)-block_mean)/sigma)*50+128<0
                            Io(x,y)=0;
                        else
                            Io(x,y)=((I(x,y)-block_mean)/sigma)*50+128;
                        end
                    end
                end
            end
            
        end
    end
            
    
    
    
    
    Io=Io/255;
    
end