clc
clear all
close all
%B=[1 1 1;1 1 1;1 1 1];


B=[0 1 0;1 1 1;0 1 0];
A=zeros(20,20);
for ii=5:15
    for jj=5:15
        A(ii,jj)=1;
    end
end
A(4,10)=1;
value=1;


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