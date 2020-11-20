% ---------------------------%
% Código para o trabalho 3 1 % 
% -------------------------  %
close all
clc
clear

[ha, pos] = tight_subplot(9,3,[.01 .03],[.1 .01],[.01 .01]);
filtros = {'average','disk','gaussian', 'laplacian', 'log','motion','prewitt','sobel'};

imagesNames = {'berlindes','floresFruta','fruta zoom'};
images = {'../images/berlindes.bmp','../images/frutaFlores.bmp', '../images/frutaFlores.bmp'};

for j=1:length(images)
    img=imread(images{j});
    h=j;
    for i=1:length(filtros)

        % sem filtro
        if i == 1
            axes(ha(h));
            imshow(img);
            if j == 1
                y= ylabel('sem filtro');
                set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
            end
            h=h+3;
        end

        filtro=fspecial(filtros{i});
        imgfiltro=imfilter(img,filtro);

        axes(ha(h));
        imshow(imgfiltro);
        if j == 1
            y = ylabel(filtros{i});
            set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
        end
        if i == length(filtros)
            xlabel(imagesNames{j});
        end
        h=h+3;
    end
end