%---------------------------
% Pussy version of script 1.3
%----------------------------

images = {'../images/baboon.bmp', '../images/birds.bmp', '../images/Tulipas.bmp', '../images/floresVermelhas.bmp','../images/folhasVerdes.bmp'}

for i=1:length(images)
    im = imread(images{i});
    rgb2yuv(images{i});
end
