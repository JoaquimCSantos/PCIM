%-----------------------%
%   Código pergunta 7   %
%-----------------------%
clc
clear
close all

%-----------------------%
%        Aúdio          %
%-----------------------%
[x,FS]=audioread('sting22.wav');
fatores = {2,4};
filtros = {[1,1],[1,1,1,1]};

for i=1:length(fatores)
    %Decimar
    imageDecimado = downsample(x,fatores{i});
    
    sinalUpsample = upsample(imageDecimado,fatores{i});
    
    sinalFiltrado = filter(filtros{i}, 1, sinalUpsample);
end


%-----------------------%
%        Visual         %
%-----------------------%
A=imread('lena512.bmp');
%figure(2)
%imshow(A,[0 255]); % displays original image
A=single(A)/255.0; % convert to float and normalizes [0, 1.0]
%title('lena512.bmp');


figure;
[ha, pos] = tight_subplot(1,2,[.01 .03],[.1 .01],[.01 .01]) ;

filtros = {[1 ,1; 1 ,1;],[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1]};


for i=1:length(fatores)
    
    %Decimar
    imageDecimado = downsample(A,fatores{i});
    imageDecimado = downsample(imageDecimado',fatores{i});
    imageDecimado = imageDecimado';
    
    imageUpsample = upsample(imageDecimado,fatores{i});
    imageUpsample = upsample(imageUpsample',fatores{i});
    imageUpsample = imageUpsample';
    
    imageFiltrado = filter2(filtros{i}, imageUpsample);
    
    axes(ha(i));
    imshow ( imageFiltrado ) ;
    xlabel(fatores{i})
end