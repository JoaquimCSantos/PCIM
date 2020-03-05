function [ output_args ] = clustering( nome_ficheiro,K)

%Le imagem
im = imread(nome_ficheiro);

%tornamos num array
imflat = double(reshape(im, size(im,1) * size(im,2), 3));

%150 iteracaoes
[kIDs, kC] = kmeans(imflat, K, 'Display', 'iter', 'MaxIter', 150, 'Start', 'sample');

% Garantimos 0-1
colormap = kC / 256; 

%geramos a imagem outra vez
imout = reshape(uint8(kIDs), size(im,1), size(im,2));

%gravamos e apresentamos
imwrite(imout - 1, colormap, 'output.png');
figure, imshow('output.png')


end

