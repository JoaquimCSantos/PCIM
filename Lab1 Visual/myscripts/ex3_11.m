% ---------------------------%
% Código para o trabalho 3 1 % 
% permite observar com       %
% detalhe os efeitos dos     %
% filtros average e gaussian %
% -------------------------  %


 % Variar as dimensões
 clc
 close all
 clear
 
 % criar matriz
[ha, pos] = tight_subplot(2,3,[.01 .03],[.1 .01],[.01 .01]);

%lê imagem
img=imread('../images/frutaFlores.bmp');

% apresenta imagem original 
axes(ha(1));
imshow(img);
axes(ha(4));
imshow(img);
xlabel('original');

% apresenta imagem com filtro average com hsize = 2
filtro=fspecial('average', 2);
imgfiltro=imfilter(img,filtro);
axes(ha(2));
imshow(imgfiltro);
x = xlabel('average hsize = 2');
set(x, 'Units', 'Normalized', 'Position', [0.5, 0, 0]);

% apresenta imagem com filtro gaussian com sigma = 2
imgGaussian = imgaussfilt(img, 2);
axes(ha(5));
imshow(imgGaussian);
x = xlabel('gaussian sigma = 2');
set(x, 'Units', 'Normalized', 'Position', [0.5, 0, 0]);

% apresenta imagem com filtro average com hsize = 8
filtro=fspecial('average', 8);
imgfiltro=imfilter(img,filtro);
axes(ha(3));
imshow(imgfiltro);
x = xlabel('average hsize = 8');
set(x, 'Units', 'Normalized', 'Position', [0.5, 0, 0]);

% apresenta imagem com filtro gaussian com sigma = 8
imgGaussian = imgaussfilt(img, 8);
axes(ha(6));
imshow(imgGaussian);
x = xlabel('gaussian sigma = 8');
set(x, 'Units', 'Normalized', 'Position', [0.5, 0, 0]);