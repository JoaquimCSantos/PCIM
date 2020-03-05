
close all;
% Vetor com os metodos
metodos = {'nearest','bilinear','bicubic','box','triangle','lanczos3'};
tamanhos = { 0.8, 2}; % SCALE para usar

h = 1; % contador para ordenar
[ha, pos] = tight_subplot(6,8,[.01 .03],[.1 .01],[.01 .01]); % criar subplot 6x2
I = imzoneplate;



for i=1:length(metodos)
    for j=1:length(tamanhos)
        
        axes(ha(h));
        imgbase = imresize(I,tamanhos{j},metodos{i}); %criar imagem
        imshow(imgbase); %introduzir no grafico 
        if i == length(metodos)
            xlabel([tamanhos{j}]) ; %introduzir x labels
        end

        if j == 1     
            y = ylabel([ metodos{i}]) ; %introduzir y labels
            set(y, 'Units', 'Normalized', 'Position', [0, 0.5, 0]);
        end
        
        h = h +1;  
        axes(ha(h));
        img = imgaussfilt(imresize(I,tamanhos{j},metodos{i})); %criar imagem com filtro Gaussiano
        imshow(img); %introduzir no grafico
        
        if i == length(metodos)
            xlabel('Filtro Gaussiano') ; %introduzir x labels
        end
        
        h = h +1;  
        axes(ha(h));
        img = medfilt2(imresize(I,tamanhos{j},metodos{i})); %criar imagem com filtro Gaussiano
        imshow(img); %introduzir no grafico
        
        if i == length(metodos)
            xlabel('Filtro Medio') ; %introduzir x labels
        end
      

        
        if j == 2
            h = h +1;
            psd = 10*log10(abs(fftshift(fft2(imgbase))).^2 );
            axes(ha(h));
            imshow(psd);
             if i == length(metodos)
                xlabel('Espectro s/filtro') ; %introduzir x labels
            end
            
            h = h +1;
            axes(ha(h));
            plot(imgbase(round(501/2),:));
             set(gca,'Xtick',[],'YTick', []);
            axis([0 1000 0 1]);
           

            
            if i == length(metodos)
                xlabel('Forma de onda') ; %introduzir x labels
            end
            
        end
        
        h = h +1;
    end
end

