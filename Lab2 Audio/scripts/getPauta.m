function [ pauta ] = getPauta(escolha)
%valores das notas
%3
si3 = 246.94/440;
% 4 
do4 = 261.63/440; do4_sustenido  = 277.18/440; 
re4 = 293.66/440; re_sustenido  = 311.13/440; 
mi4 = 329.63/440;
fa4 = 349.23/440; fa4_sustenido  = 369.99/440;
sol4 = 392.00/440;sol4_sustenido = 415.30/440;
la4 = 440.00/440; las4_ustenido  = 466.16/440;
si4 = 493.88/440; si4_bemol      = 466.16/440;
%5 
do5 = 523.25/440; do5_sustenido  = 554.37/440; 
re5 = 587.33/440; r5_sustenido   = 622.25/440; 
mi5 = 659.25/440;
fa5 = 698.46/440; fa5_sustenido  = 739.99/440;
sol5 = 783.99/440;sol5_sustenido = 830.61/440;
la5 = 880.00/440; las5_ustenido  = 932.33/440;
si5 = 987.77/440; si5_bemol      = 932.33/440;
%6 
do6 = 1046.50/440; do6_sustenido  = 1108.73/440; 
re6 = 1174.66/440; r6_sustenido  = 1244.51/440; 
mi6 = 1318.51/440;
fa6 = 1396.91/440; fa6_sustenido  = 1479.98/440;
sol6 = 1567.98/440;sol6_sustenido = 1661.22/440;
la6 = 1760.00/440; las6_ustenido  = 1864.66/440;
si6 = 1975.53/440; si6_bemol      = 1864.66/440;

%tempo das notas
seminima     = 0.3; 
semibreve    = 4    * seminima;
minima       = 2    * seminima;
minimap      = minima + 0.5*minima;
colcheia     = 1/2  * seminima;
colcheiap    = colcheia + colcheia*0.5;
semicolcheia = 1/4  * seminima;
fusa         = 1/8  * seminima;  
semifusa     = 1/16 * seminima;

if escolha == 1
    %domimi
    pauta = [1 seminima do4 1 seminima re4 1 seminima mi4 1 seminima fa4 1 seminima fa4 1 seminima fa4 1 seminima do4 1 seminima re4 1 seminima do4 1 seminima re4 1 seminima re4 1 seminima re4 1 seminima do4 1 seminima sol4 1 seminima fa4 1 seminima mi4 1 seminima mi4 1 seminima mi4 1 seminima do4 1 seminima re4 1 seminima mi4 1 seminima fa4 1 seminima];
elseif escolha == 2
    %Parabens
    pauta = [1 seminima re4 1 seminima re4 1 seminima mi4 1 seminima re4 1 seminima sol4 1 minima fa4_sustenido 1 seminima re4 1 seminima re4 1 seminima mi4 1 seminima re4 1 seminima la4 1 minima sol4 1 seminima si4 1 seminima si4 1 seminima re5 1 seminima si4 1 seminima sol4 1 seminima fa4_sustenido 1 seminima mi4  1 seminima do5 1 seminima do5 1 seminima si4 1 seminima sol4 1 seminima la4 1 minima sol4 1 seminima re4 1 seminima re4 1 seminima mi4 1 seminima re4 1 seminima sol4 1 minima fa4_sustenido 1 seminima re4 1 seminima re4 1 seminima mi4 1 seminima re4 1 seminima la4 1 minima sol4 1 seminima si4 1 seminima si4 1 seminima re5 1 seminima si4 1 seminima sol4 1 seminima fa4_sustenido 1 seminima re4 1 seminima do5 1 seminima do5 1 seminima si4 1 seminima sol4 1 seminima la4 1 minimap sol4];
elseif escolha == 3
    %U2
    pauta = [1 minimap si6 1 semibreve+colcheia la6 1 seminima mi6 1 colcheia fa6_sustenido 1 colcheia mi6 1 semifusa 0 1 seminima fa6_sustenido 1 minimap si6 1 semibreve+colcheia la6 1 seminima mi6 1 colcheia fa6_sustenido  1 colcheia mi6 1 semifusa 0 1 seminima fa6_sustenido 1 minimap si6 1 semibreve+colcheia la6 1 seminima mi6 1 colcheia fa6_sustenido 1 colcheia mi6 1 semifusa 0 1 seminima fa6_sustenido 1 minimap si6 1 semibreve+colcheia la6 ];
elseif escolha == 4
    %Star wars - Main theme
    %pauta = [1 colcheia re4 1 colcheia re4 1 colcheia re4 1 minima sol4 1 colcheia re5 1 colcheia do5 1 colcheia si4 1 colcheia la4 1 minima sol5  1 colcheia re5 1 semibreve 0 1 seminima 0 3 seminima si4 mi5 sol5  1 seminima 0 3 seminima si4 mi5 sol5];
    pauta = [1 minima do4 1 minima sol4 1 colcheia fa4 1 colcheia mi4 1 colcheia re4 1 minima do5 1 colcheia sol4 1 colcheia fa4 1 colcheia mi4 1 colcheia re4 1 minima do5 1 colcheia sol4 1 colcheia fa4 1 colcheia mi4 1 colcheia fa4 1 minima re4 1 minima 0 1 colcheia mi5 1 colcheia mi5 1 colcheia mi5  1 4*minima 0];
elseif escolha == 6
    pauta = [2 minima re4 fa4 ];
elseif escolha == 5
    %testar acorde
    pauta = [3 seminima la4 re5 fa5 3 seminima la4 re5 fa5 3 seminima la4 re5 fa5 3 minima si4 mi5 sol5 3 minima si4 mi5 sol5 2 colcheia mi4 sol4 2 colcheia sol4 si4 2 colcheia sol4 si4 2 colcheia si4 fa5 2 colcheia si4 mi5 2 colcheia mi5 sol5 2 colcheia mi5 sol5 2 colcheia sol5 si5 1 seminima 0 2 seminima si3 si4 2 seminima si3 si4 2 seminima si3 si4 2 seminima do4 do5 3 seminima do5 mi5 sol5 3 seminima do5 mi5 sol5 3 seminima do5 mi5 sol5 2 minima do4 do5 3 minima do5 mi5 sol5 ];
end
end

