% Código para o 1.3

clc;
clear;
close all;
    
[ha, pos] = tight_subplot(9,5,[.01 .03],[.1 .01],[.01 .01]) 
imagesNames = {'baboon', 'birds', 'Tulipas','vermelhas','verdes'};
images = {'../images/baboon.bmp', '../images/birds.bmp', '../images/Tulipas.bmp', '../images/floresVermelhas.bmp','../images/folhasVerdes.bmp'}

for i=1:length(images)
    
    I=imread(images{i});
    axes(ha(i)); 
    imshow(I); 
    if i == 1     
        y = ylabel(['Original']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    R=I(:,:,1); axes(ha(i+5));,imshow (R);
     if i == 1     
        y = ylabel(['R']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    G=I(:,:,2); axes(ha(i+10));,imshow(G);
    
     if i == 1     
        y = ylabel(['G']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    B=I(:,:,3); axes(ha(i+15));,imshow(B);
     if i == 1     
        y = ylabel(['B']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    Y = 0.299 * R + 0.587 * G + 0.114 * B;

    axes(ha(i+20));,imshow(Y);
     if i == 1     
        y = ylabel(['Y']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    U = -0.14713 * R - 0.28886 * G + 0.436 * B;

    axes(ha(i+25));,imshow(U+128);
     if i == 1     
        y = ylabel(['U + 128']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    V = 0.615 * R - 0.51499 * G - 0.10001 * B;

    axes(ha(i+30));,imshow(V+128);
     if i == 1     
        y = ylabel(['V+128']) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    YUV = cat(3,Y,U,V);

    axes(ha(i+35));,imshow(YUV);
     if i == 1     
        y = ylabel({'YUV';'cat(3,Y,U,V)'}) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end

    R = Y + 1.139834576 * V;

    G = Y -.3946460533 * U -.58060 * V;

    B = Y + 2.032111938 * U;

    RGB = cat(3,R,G,B);
    axes(ha(i+40));
    imshow(RGB);
    if i == 1     
        y = ylabel({'RGB';'cat(3,R,G,B)'}) ; %introduzir y labels
        set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
    end
    xlabel([imagesNames{i}]) ; %introduzir x labels
end