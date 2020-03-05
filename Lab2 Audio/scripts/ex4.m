%--------------------------------------%
%      Código relativo ao 4            %                                   
%--------------------------------------%

%variaveis

Fs =22050;
musica = 0;

escolha = input(' 1 - Do Mi Mi\n 2 - Parabens\n 3 - U2\n 4 - Star wars | Main theme\n 5 - Champions\n 6 - Testar Acorde\n  ');
pauta = getPauta(escolha);

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