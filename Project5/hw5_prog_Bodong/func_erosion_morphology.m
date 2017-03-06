function AerosionB = func_erosion_morphology(A,B,value)
%The size of B should be odd!!!!!!!!!!!!!!!!!!!!!!
%when detected, set equals to 'value'
%0 means not detected
    AerosionB=zeros(size(A));
    %B_rotate=rot90(B,2);
    [Bw,Bh]=size(B);
    Bw=(Bw-1)/2;
    Bh=(Bh-1)/2;
    for x=1:size(A,1)
        for y=1:size(A,2)
            flag=1;
            for m=-Bw:Bw
                for n=-Bh:Bh
                    
                    if x+m>0&&x+m<=size(A,1)&&y+n>0&&y+n<=size(A,2)
                        if B(m+Bw+1,n+Bh+1)~=0&&A(x+m,y+n)==0
                            flag=0;
                        end
                    end
                end
            end
            if flag~=0;
                AerosionB(x,y)=value;
            end
        end
    end
    
    
end