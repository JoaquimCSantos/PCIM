% Código para o amplia e reduz base
I = imzoneplate;
figure;
[ha, pos] = tight_subplot(1,3,[.01 .03],[.1 .01],[.01 .01]); % criar subplot 6x2

axes(ha(1));
imshow(I);
xlabel('Imagem original');

% Dominio das frequencias
psd = 10*log10(abs(fftshift(fft2(I))).^2 );
axes(ha(2));
imshow(psd);
xlabel('Dominio das frequencias');


% Forma de onda 
axes(ha(3));
plot(I(round(501/2),:));
xlabel('Forma de onda');