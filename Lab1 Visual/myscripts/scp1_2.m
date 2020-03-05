%CODIGO PARA a pergunta 1.2
clc;
clear;
close all;
    
[ha, pos] = tight_subplot(8,5,[.01 .03],[.1 .01],[.01 .01]) 
imagesNames = {'baboon', 'birds', 'Tulipas','vermelhas','verdes'};
images = {'../images/baboon.bmp', '../images/birds.bmp', '../images/Tulipas.bmp', '../images/floresVermelhas.bmp','../images/folhasVerdes.bmp'}
for i=1:length(images)
    im = imread(images{i});

    axes(ha(i));
    imshow(im);
    %title('Fig 1 - Imagem original');
    %poe em cada matriz e mostra
    if i == 1     
        y = ylabel(['Original']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    r = im(:, :, 1); 
    g = im(:, :, 2); 
    b = im(:, :, 3);

    axes(ha(i + 5));imshow(r);
    if i == 1     
        y = ylabel(['R']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    axes(ha(i + 10));
    imshow(g);
    if i == 1     
        y = ylabel(['G']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    axes(ha(i + 15));imshow(b);
    if i == 1     
        y = ylabel(['B']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    axes(ha(i + 20));imshow(rgb2ycbcr(im));
    if i == 1     
        y = ylabel(['YCbCr']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    %converte para hsv e separa em cada componente
    YCbCr = rgb2ycbcr(im);
    Y = YCbCr(:,:,1);
    Cb = YCbCr(:,:,2);
    Cr= YCbCr(:,:,3);
    
    %mostra cada componente
    axes(ha(i+25));imshow(Y);
    if i == 1     
        y = ylabel(['Y']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    axes(ha(i+30));imshow(Cb);
    if i == 1     
        y = ylabel(['Cb']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    axes(ha(i+35));imshow(Cr);
    if i == 1     
        y = ylabel(['Cr']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    xlabel([imagesNames{i}]) ; %introduzir x labels
end