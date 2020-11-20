% -----------------------------%
% Código para o trabalho 3 2 a %
% -----------------------------%
 clc
 close all
 clear
 
 % criar matriz
[ha, pos] = tight_subplot(2,4,[.01 .03],[.1 .01],[.01 .01]);

% mostra imagem original %
img=imread('../images/ruido1.jpg');
axes(ha(1));
imshow(img);
y = ylabel('ruido1');
set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);

img2=imread('../images/ruido2.jpg');
axes(ha(5));
imshow(img2);
y= ylabel('ruido2');
set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
xlabel('original');

% mostra 3x3 %
H = fspecial('average',[3 3]);
imc=imfilter(img,H,'conv');
axes(ha(2));
imshow(imc);

H = fspecial('average',[3 3]);
imc2=imfilter(img2,H,'conv');
axes(ha(6));
imshow(imc2);
xlabel('average 3x3');

% mostra 5x5 %
H = fspecial('average',[5 5]);
imc=imfilter(img,H,'conv');
axes(ha(3));
imshow(imc);

H = fspecial('average',[5 5]);
imc2=imfilter(img2,H,'conv');
axes(ha(7));
imshow(imc2);
xlabel('average 5x5');

% mediana
imc=medfilt2(img);
axes(ha(4));
imshow(imc);

imc2=medfilt2(img2);
axes(ha(8));
imshow(imc2);
xlabel('Mediana');

