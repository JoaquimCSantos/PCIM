%CODIGO PARA a pergunta 1.1
clc;
clear;
close all;
    
[ha, pos] = tight_subplot(8,5,[.01 .03],[.1 .01],[.01 .01]) 
images = {'../images/baboon.bmp', '../images/birds.bmp', '../images/Tulipas.bmp', '../images/floresVermelhas.bmp','../images/folhasVerdes.bmp'}
for i=1:length(images)
    im = imread(images{i});

    axes(ha(i));
    imshow(im);
    %title('Fig 1 - Imagem original');
    %poe em cada matriz e mostra

    r = im(:, :, 1); 
    g = im(:, :, 2); 
    b = im(:, :, 3);

    axes(ha(i + 5));imshow(r);
    %title('Fig 2 - Componente R da imagem');
    axes(ha(i + 10));
    imshow(g);
    %title('Fig 3 - Componente G da imagem');
    axes(ha(i + 15));imshow(b);
    %title('Fig 4 - Componente B da imagem');

    axes(ha(i + 20));imshow(rgb2hsv(im));
    %title('Fig 5 - Imagem no espaco cores HSV');
    %converte para hsv e separa em cada componente
    [H,S,V] = rgb2hsv(im);

    %mostra cada componente
    axes(ha(i+25));imshow(H);
    %title('Fig 6 - Componente H da imagem');
    axes(ha(i+30));imshow(S);
    %title('Fig 7 - Componente S da imagem');
    axes(ha(i+35));imshow(V);
    %title('Fig 8 - Componente V da imagem');
end




