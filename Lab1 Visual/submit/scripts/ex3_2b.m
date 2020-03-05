% -----------------------------%
% Código para o trabalho 3 2 a %
% permite aplicar os operadores%
% sobel e prewitt as imagens   %
% -----------------------------%
clear
clc
close all

[ha, pos] = tight_subplot(3,5,[.01 .03],[.1 .01],[.01 .01])

imagesNames = {'casa1', 'casa2', 'contorno'};
images = {'../images/casa1.jpg', '../images/casa2.jpg', '../images/contorno.jpg'};
h = 1;
for i=1:length(images)
    
    im = imread(images{i});
    axes(ha(h));
    imshow(im);
    h = 1 +h;
    y = ylabel(imagesNames{i});
    set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    if i==length(images)
        xlabel('original');
    end
    
    % sobel zeros horixontar
    imc=conv2(double(im),double([-1 -2 -1; 0 0 0; 1 2 1]));
    imc=uint8(imc);
    axes(ha(h));
    imshow(imc);
    h = 1 +h;
    if i==length(images)
        xlabel('Sobel 0 hor');
    end
    
    % sobel zeros vertical
    imc=conv2(double(im),double([-1 0 1; -2 0 2; -1 0 1]));
    imc=uint8(imc);
    axes(ha(h));
    imshow(imc)
    h = 1 +h;
    if i==length(images)
        xlabel('Sobel 0 vert');
    end
    
     % prewitt zeros horixontar
    imc=conv2(double(im),double([1 1 1; 0 0 0; -1 -1 -1]));
    imc=uint8(imc);
    axes(ha(h));
    imshow(imc);
    h = 1 +h;
    if i==length(images)
        xlabel('Prewitt 0 hor');
    end
    
    % sobel zeros vertical
    imc=conv2(double(im),double([-1 0 1; -1 0 1; -1 0 1]));
    imc=uint8(imc);
    axes(ha(h));
    imshow(imc);
    h = 1 +h;
    if i==length(images)
        xlabel('Prewitt 0 vert');
    end
end