%--------------------------------------%
%      Código relativo ao 5            %                                   
%--------------------------------------%

clc
clear
close all

[x,Fs] = audioread('u2.wav');
time=(1:length(x))/Fs;
musica = 0;

%[pxx,w] = periodogram(x);
%plot(w,10*log10(pxx))
% 
 figure
 periodogram(x,[],length(x),Fs)
 figure
 spectrogram(x,[],[],[],Fs);
% [s,w,t,ps]=spectrogram(x,[],[],[],Fs);
% [M,I] = max(ps);

pauta = getPauta(3);

f = waitbar(0,'Criando a musica');
[m,n]=size(pauta);
i=1;
while i<(n)
    nota = 0;
    j=1;
    
    %fazer acordes
    for j=1:pauta(i)
        
        %obtem nova nota
        notanova = geranota(pauta(i+1+j),pauta(i+1),Fs);
        diferenca = length(notanova) - length(nota);
        if diferenca > 0
            nota = horzcat(nota, zeros(1,diferenca));
        elseif diferenca < 0
            notanova = horzcat(notanova, zeros(1,diferenca));
        end
        
        nota = nota + notanova;

    end
        

    musica = horzcat(musica,nota);
    waitbar(100*i/n,f);
    

    i = i+2+ pauta(i); %temos de ter em conta os acordes
   
end
musica = musica/max(musica);
close(f);
sound(musica,Fs);