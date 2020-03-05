function [ output ] = binarizacao( nome_ficheiro)
o = -1;

while( o<0 || o > 1 && o ~= 2  )
    o = input('Esolha o threshold: entre [0,1] ou 2 para ser calculado pelo metodo otsu: ');
end

[I,cmap] = imread(nome_ficheiro);

if o == 2
    [counts,x] = imhist(I,256);
    stem(x,counts);
    T = otsuthresh(counts);

    I = rgb2gray(I);
    BW = imbinarize(I,T);
else
    I = rgb2gray(I);
    BW = imbinarize(I,o);
end
figure
imshow(BW)
imshowpair(I,BW,'montage')
end

