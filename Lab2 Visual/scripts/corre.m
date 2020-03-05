close all
clear
clc

nome_ficheiro = input('Qual o nome da imagem a usar?  ','s');
option = input('1 - Binarizacao | | 2 Clustering| | 3 - Region Growing ');
K=-1;
switch option
    case 1
        binarizacao(nome_ficheiro)
    case 2
        while(K<1 || K>7 )
            K = input('Escolha K para kmeans:  ');
        end
        clustering(nome_ficheiro,K);
    case 3
        region_growing(nome_ficheiro)
    otherwise
        display('ou 1 ou 2 ou 3')
end



