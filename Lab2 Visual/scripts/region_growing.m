function [ output_args ] = region_growing( nome_imagem )

hist_size = 4;
[I,cmap] = imread(nome_imagem);

%Testes
%HSV - testar quantidade de V
[H S V] = rgb2hsv(I);
threshV = multithresh(V, 2);

%GRAY - testar semalhanca com binarizacao
Grey = rgb2gray(I);
threshG = multithresh(Grey, 3);
[counts,x] = imhist(I,256);
T = otsuthresh(counts);

%Gradiente - testar com imagem gradiente
[Gmag, Gdir] = imgradient(Grey,'prewitt');
threshGmag = multithresh(Grey, 3);
mediana = median(median(Gmag));
media = mean(mean(Gmag));


thresh_array= threshV;
Imagem_testar = V;

figure(1), imshow(I)

[x,y]=ginput(1); %Pixel


%Imagem para adicionar as regioes
[I_nova,cmap] = imread(nome_imagem);

%criar mapa
[sz1,sz2,sz3] = size(I);
mapa = zeros(sz1,sz2);

neigb=[-1 0; 1 0; 0 -1;0 1];

fifo = dsp.AsyncBuffer;
write(fifo, [y,x]);
coord = read(fifo,1)

I_nova(round(y), round(x)) = 1 ;
mapa(round(y), round(x)) = 1;
figure(2) ,imshow(mapa)
figure(3) ,imshow(I_nova)

conta = 0;
iteracoes = 0
f = waitbar(0,'Criar segmentacao');
size_total= sz1*sz2;

while(coord)
    x = round(coord(2));y = round(coord(1));
    
    for j=1:4
        xn = round(x+neigb(j,1)); yn = round(y +neigb(j,2));
        if( xn > 0 && yn > 0 && xn <= sz2 && yn <= sz1)
            if( mapa(yn,xn) == 0)
                
                %Use threshold
                t_o=compute_thresh(thresh_array,Imagem_testar(y,x));
                t_t=compute_thresh(thresh_array,Imagem_testar(yn,xn));
                
                %Usar histograma
                %[countso,xo] = imhist(I(y,x),hist_size);
                %[countst,xt] = imhist(I(yn,xn),hist_size);
                %pos_o = find(countso==1); pos_t = find(countst==1);
                %pos_o == pos_t
                
                %Grey(yn,xn) > 108
                %Gmag(yn,xn) > mediana
                if(Gmag(yn,xn) > media)
                    I_nova(yn,xn) = t_o/hist_size;
                    if( xn > 0 && yn > 0 && xn <= sz2 && yn <= sz1)
                        write(fifo, [yn,xn]);
                    end
                end
                mapa(yn,xn) = 1;
                
            end
        end
        
        iteracoes = iteracoes +1;
        if(mod(iteracoes,100)==0)
            
            waitbar(iteracoes/size_total,f,'...');
        end
    end
    coord = read(fifo,1);
end

figure(2) ,imshow(mapa)
figure(3) ,imshow(I_nova)
end

