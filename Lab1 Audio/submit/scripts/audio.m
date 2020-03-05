%---------------%
%   Audio Part  %
%---------------%

clc
clear
close all

[x,FS]=audioread('sting22.wav');
%sound(x,FS); % NOTA: x values are already in the range [-1, 1]
samples=[0:length(x)-1];

figure(1)
plot(samples/FS, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('sting22.wav');

%Compare all Qunatizzation values
%all
figure;
[ha, pos] = tight_subplot(1,4,[.01 .03],[.1 .01],[.01 .01]) ;
h = 1;
%SNR
snrs{1,8} = [];
coefs{1,8} = [];
Ns = {2,4,6,8,10,12,14,16};

for i=1:length(Ns)
    
  sinalQuantizado = quantiza(x,Ns{i});
  sinalRuido = sinalQuantizado-x;
  
  %calcular snr
  snrs{i} = snr(x,sinalQuantizado-x);
  
  %imprimir multi N
  if mod(i,2) ==0
      axes(ha(h));
      plot(samples/FS,sinalQuantizado);
      xlabel(Ns{i});
      h =h +1;
  end
  
   
  %Coeficientes 
   %help corrcoef
  [r,p] = corrcoef(x,sinalRuido); %retorna duas matrizes, a matriz P trata da correlação
  coefs{i} = r(1,2); % na diagonal 1, na outra se for < 0.05 a correlacao é significante
  
  %ouvir
  if i == 6
       ouvirSinalQuantizado = sinalQuantizado;
       ouvirSinalOriginal = x;
       ouvirSinalRuido = x - sinalQuantizado;
  end
end

figure;
Nsmatriz = cell2mat(Ns(1,1:7));
SNRsMatriz = cell2mat(snrs(1,1:7));
plot(Nsmatriz,SNRsMatriz,'x');

figure;
coefsMatriz = cell2mat(coefs(1,1:7));
plot(Nsmatriz,coefsMatriz,'x');


%figure;
%Nsmatriz = cell2mat(Ns);
%coefsMatriz = cell2mat(coefs);
%plot(coefsMatriz);
%xlabel('Erro quantização');

 %for i=1:length(Ns)
 %  scatter(Ns{i},snrs{i})
 %  hold on;  
 %end


