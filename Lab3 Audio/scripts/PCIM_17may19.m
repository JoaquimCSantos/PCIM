%
% Este conjunto de comandos Matlab faz parte das aulas
% da UC PROCESSAMENTO E CODIFICA��O DE INFORMA��O MULTIM�DIA
% (PCIM), integrada no Mestrado Integrado em
% Engenharia Electrot�cnica e Computadores (MIEEC), da
% Faculdade de Engenharia da Universidade do Porto (FEUP).
%
% � permitida a utiliza��o por outras pessoas que n�o
% frequentem a disciplina, unicamente para objectivos acad�micos
% ou auto-estudo e desde que seja feita men��o, em qualquer trabalho
% publicado ou exposto publicamente, da fonte: "Elementos de Estudo
% da Unidade Curricular PCIM do curso MIEEC (FEUP)".
%
% Qualquer outra utiliza��o dever� ser objecto de um pedido
% de autoriza��o dirigido por escrito ao autor e que s�
% ser� v�lido se houver uma resposta EXPL�CITA e favor�vel.
%
% (c) An�bal Ferreira; ajf(at)fe.up.pt
%

% objectivo: an�lise, modifica��o no dom�nio das frequ�ncias e s�ntese de
% um sinal �udio

close all
clc
clear

% input audio file (raw PCM)
%
inpfile = 'sound.wav';
outfile = 'newsound.wav';

%
% N        = comprimento da transformada DFT (calculada atrav�s da FFT)
% N/2      = sobreposi��o entre tramas, i.e, overlap � de 50%
% win      = janela de an�lise (qual a sua utilidade ?)
%
N=1024; N2=N/2;
win=sin(pi/N*[0:(N-1)].');

%
% l� ficheiro �udio
%
[datain,FS]=audioread(inpfile); % NOTA: dados surgem normalizados entre 0 e 1
% [datain,FS,bits]=wavread(inpfile); % OLD
% disp('bits por amostra: '); bits

nread=length(datain);
disp('Frequ�ncia de amostragem: '); FS

% vector de sa�da
dataout = zeros(size(datain));

%
% NOTA: alternativa de leitura de ficheiro �udio em PCM "raw"
% (ou seja sem cabe�alho identificador), a leitura � bin�ria
% e atrav�s de "shorts" j� que se sabe que cada amostra est�
% representada numa palavra representando um inteiro de 16 bits,
% como esta palavra inclui sinal, a gama poss�vel � [-32768, 32767]
%
%fid = fopen(inpfile,'r');
%[data, nread] = fread(fid,'short');
%fclose(fid);



tmpdata = zeros(N,1);	%% input (int) data

% NOTA: usamos para visualizar s� os pontos
% entre 1 e N/2+1 da an�lise de Fourier (calculada
% atrav�s da FFT) j� que os restantes s�o uma
% repetic�o destes, porqu� ?
regiaofreq = [1:N2+1];

frame=1;

while((frame+1)*N2 < nread),

%    
% NOTA: a instru��o seguinte � usada para
% delimitar o segmento que se pretende seleccionar

   varre = [1+(frame-1)*N2:(frame+1)*N2];

   tmpdata=datain(varre);

% representa sinal temporal
   figure(1);
   plot([0:N-1],tmpdata(1:N));
   xlabel('Amostras temporais');
   ylabel('Amplitude normalizada');
   title('Sinal nos Tempos');
   
%
% FFT
%
   tmpdata=tmpdata.*win;
   fdata=fft(tmpdata);
   magnitude=eps+abs(fdata);
   fase=phase(fdata);

   figure(2);
   plot(FS/N*(regiaofreq-1),20*log10(magnitude(regiaofreq)));
   xlabel('Frequ�ncia');
   ylabel('Densidade Espectral (dB)');
   title('Sinal nas Frequ�ncias');
   
   
%   aqui tem lugar a modifica��o espectral

%   ru�do de quantiza��o fica com espectro plano
% SMR= -6.7756;
% Ps = sum((abs(fdata(regiaofreq))).^2);
% delta = sqrt((12*Ps)/(N2*10^(SMR/10)));
% Xq = floor(0.5 + 0.5*j + (fdata(regiaofreq) ./ delta));
% fdata(regiaofreq) = delta .* Xq;


%  ru�do de quantiza��o fica com espectro semelhante ao do sinal (SMR constante)

SMR = 19.899;

for k = regiaofreq

    Ps(k) = abs(fdata(k))^2;
    delta(k) = sqrt((12*Ps(k))/(10^(SMR/10)));
    Xq(k) = floor(0.5 + 0.5*j +(fdata(k)/delta(k)));
    fdata(k) = delta(k)*Xq(k);
end

%
% IFFT
%
%    fdata=magnitude.*exp(i*fase);
   
   %figure(2);
   %hold on;
   %plot(FS/N*(regiaofreq-1),20*log10(abs(fdata(regiaofreq))),'r');
   %hold off;

%    fdata(1)=magnitude(1)*sign(exp(i*fase(1))); % porqu� ?
%    fdata(N2+1)=magnitude(N2+1)*sign(exp(i*fase(N2+1))); % porqu� ?
   fdata(N:-1:N2+2)=conj(fdata(2:N2)); % porqu� ?
   
   tmpdata=real(ifft(fdata));
   tmpdata=tmpdata.*win;
   dataout(varre)=dataout(varre)+tmpdata;
   
   %figure(1);
   %hold on;
   %plot([0:N-1],tmpdata(1:N),'r');
   %hold off;

   %pause;
   frame=frame+1;

end

SNR = snr(datain,dataout-datain)


figure;
fftdatain = fft(datain , N);
fftdifsignal = fft(dataout-datain , N);

plot(FS/N*(regiaofreq -1), 20*log10(abs(fftdatain(regiaofreq))));
hold on;
plot(FS/N*(regiaofreq -1), 20*log10(abs(fftdifsignal(regiaofreq))));
hold off;
xlabel('Frequência (Hz)');
ylabel('Densidade Espetral (dB)');
title('Espetro do Sinal e Ruído Colorido com SNR = 20 DB');
legend('Sinal Original', 'Ruído');

% grava sinal de sa�da
audiowrite(outfile, dataout, FS);
% wavwrite(dataout, FS, bits, outfile); % OLD

% calculo do SNR: de modo identico ao utilizado em qzmdct.m

disp('Fim de processamento.');