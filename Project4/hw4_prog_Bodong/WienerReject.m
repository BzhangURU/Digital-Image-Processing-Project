function Io= WienerReject(I,H,K)
%where I is the degraded input image(spatial domain), H is the degradation in the Fourier domain(shifted), K is the
% % %parameter for Wiener filtering and Io is the output image(spatial domain). 
    if(ndims(I)==3)
        I=rgb2gray(I);
    end
    %intensity should between 0 and 1
    if max(max(I))>1
        display('Intensity should not exceed 1');
        pause;
    end
    
    if min(min(I))<0
        display('Intensity should not be smaller than 0');
        pause;
    end
    %transform image into frequency domain
    I_fre=fft2(I);
    I_fre_shift=fftshift(I_fre);

    [m,n]=size(I_fre_shift);
    if size(I_fre_shift)~=size(H)
        display('size(I_fre_shift)~=size(H)');
        pause;
    end
    I_fre_shift_filtered=zeros(size(I_fre_shift));
    %Wiener Filtering
    for u=1:m
        for v=1:n
            I_fre_shift_filtered(u,v)=I_fre_shift(u,v)*conj(H(u,v))/(abs(H(u,v))*abs(H(u,v))+K);
        end
    end
    %Transform into spatial domain
    I_fre_filtered=ifftshift(I_fre_shift_filtered);
    Io=ifft2(I_fre_filtered);


end

