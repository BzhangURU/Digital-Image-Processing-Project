function AdilationB = func_dilation_grey_morphology(A,B,value)
%The size of B should be odd!!!!!!!!!!!!!!!!!!!!!!
%when detected, set equals to value
%0 means not detected
    AdilationB=zeros(size(A));
    B_rotate=rot90(B,2);
    [Bw,Bh]=size(B_rotate);
    Bw=(Bw-1)/2;
    Bh=(Bh-1)/2;
    for x=1:size(A,1)
        for y=1:size(A,2)
            flag=0;
            for m=-Bw:Bw
                for n=-Bh:Bh
                    
                    if x+m>0&&x+m<=size(A,1)&&y+n>0&&y+n<=size(A,2)
                        if A(x+m,y+n)*B_rotate(m+Bw+1,n+Bh+1)~=0
                            flag=1;
                        end
                    end
                end
            end
            if flag~=0;
                AdilationB(x,y)=value;
            end
        end
    end
    
    
end