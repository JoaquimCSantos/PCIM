%cria uma subplots
[ha, pos] = tight_subplot(2,2,[.01 .03],[.1 .01],[.01 .01]) 

%passa figura criada por imzoneplate para I
I = imzoneplate;
axes(ha(1));imshow(I);

%faz resize da imagem usando im resize e grava em J;
J = imresize(I,1.1);
axes(ha(2));imshow(J);

%Resample com um rate de 3/2 a I
axes(ha(3));imshow(resample(I,3,2));
%Resample com um rate de 3/2 a J
axes(ha(4));imshow(resample(J,3,2));



