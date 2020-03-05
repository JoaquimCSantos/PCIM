%--------------------------------------%
%      Código relativo ao 3            %                                   
%--------------------------------------%

clc
clear
close all

%variaveis
tempo = 0.3; %300ms
Fs =22050;
musica = 0;

%valores das notas
do = 261.63/440;
re = 293.66/440;
mi = 329.63/440;
fa = 349.23/440;
sol = 392.00/440;
la = 440.00/440;
si = 493.88/440;

%Do mi mi 
pauta = [do re mi fa fa fa do re do re re re do sol fa mi mi mi do re mi fa];

%brincadeira
f = waitbar(0,'Criando a musica');
for i=1:length(pauta)
    nota = geranota(pauta(i),tempo,Fs);
    musica = horzcat(musica,nota);
    waitbar(100*i/length(pauta),f);
end
close(f);
musica = musica/max(musica);
sound(musica,Fs);
