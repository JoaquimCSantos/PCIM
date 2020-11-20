%--------------------------------------%
%      Código relativo ao 3.3          %
%                                      %
% permite observar contornos canny com %
% vários valores de threshold e de     % 
% sigma                                %
%--------------------------------------%

clc
clear
close all
[ha, pos] = tight_subplot(1,6,[.01 .03],[.1 .01],[.01 .01]);

img=imread('../images/contorno.jpg');

% imagem original
axes(ha(1));
imshow(img);
xlabel('original');

%uso de canny defautl threshold[0 1] sigma sqrt(2)
imgEdge=edge(img,'canny');
axes(ha(2));
imshow(imgEdge);
xlabel('canny default');

%uso de canny threshhold [0.5 0.55]
imgEdge=edge(img,'canny',[0.1 0.55]);
axes(ha(3));
imshow(imgEdge);
xlabel('canny [0.1 0.55]');

%uso de canny threshhold [0.5 0.75]
imgEdge=edge(img,'canny',[0.5 0.75]);
axes(ha(4));
imshow(imgEdge);
xlabel('canny [0.5 0.75]');

%uso de canny threshhold [0.5 0.75] sigam 0.9
imgEdge=edge(img,'canny',[0.5 0.75],0.9);
axes(ha(5));
imshow(imgEdge);
xlabel('canny [0.5 0.75] 0.9');

%uso de canny threshhold [0.5 0.75] sigam 0.9
imgEdge=edge(img,'canny',[0.5 0.75],2);
axes(ha(6));
imshow(imgEdge);
xlabel('canny [0.5 0.75] 2');
