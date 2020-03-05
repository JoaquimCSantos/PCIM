%-----------------------%
%   Código pergunta 4,5 %
%-----------------------%

close all
clc
clear

% reads and displays image
I=imread('lena512.bmp');
figure(2)
imshow(I,[0 255]); % displays original image
I=single(I)/255.0; % convert to float and normalizes [0, 1.0]
title('lena512.bmp');

Ns = {2,3,4,5,6,7,8};
snrs{1,7} = [];

figure;
[ha, pos] = tight_subplot(1,7,[.01 .03],[.1 .01],[.01 .01]);


for i=1:length(Ns)
    
    %Quantiza
    quantizeImage = quantiza(I,Ns{i});
    
    %Ruído
    imagemRuido = quantizeImage-I;
    
    %SNR
    snrs{i} = snr(I,imagemRuido);
    
    axes(ha(i));
    imshow(quantizeImage,[]);
    xlabel(Ns{i});
end

figure;
Nsmatriz = cell2mat(Ns);
SNRsMatriz = cell2mat(snrs);
plot(Nsmatriz,SNRsMatriz,'x');

% insert code here
%Ar=A; % this is temporary, to be replaced by the new code
%Ar=uint8(Ar*255.0); % convert to "uint" format
%figure(3)
%imshow(Ar,[0 255]); % displays modified image
%title('modified Lena');
