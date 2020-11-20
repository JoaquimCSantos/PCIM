%-----------------------%
%   Código pergunta 6   %
%-----------------------%

close all
clc
clear

samples=[0:499];
x=sin(0.22*samples);

snrs{1,7} = [];
snrsIdeal{1,7} = [];
Ns = {2,3,4,5,6,7,8};
figure
for i=1:length(Ns)
    
  sinalQuantizado = quantiza(x,Ns{i});
  sinalRuido = sinalQuantizado-x;
  
  snrs{i} = snr(x,sinalQuantizado-x);
  snrsIdeal{i} = 6.02*Ns{i} + 7.8;

end

figure;
Nsmatriz = cell2mat(Ns);
SNRsMatriz = cell2mat(snrs);
scatter(Nsmatriz,SNRsMatriz,[],[0 0 1],'*');

hold on
SNRsIdealMatriz = cell2mat(snrsIdeal);
scatter(Nsmatriz,SNRsIdealMatriz,[],[1 0 1],'o');
