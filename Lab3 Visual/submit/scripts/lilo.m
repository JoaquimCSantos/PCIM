%--------------------------------------------------%
%                                                  %
% Programa para correr para detecção corte de cena %
%                                                  %
%--------------------------------------------------%

clear
close all
clc

disp('Selecione video mpeg or avi ');
[filename, pathname] = uigetfile('*.*', 'open video');

fullname=fullfile(pathname,filename);

option = input('1 - IAM | | 2 Histograma | | 3 - 3 Step Search ');

switch option
    case 1        
        iam(fullname);  
    case 2
        histograma(fullname);
    case 3
        tss(fullname);
    otherwise
        display('ou 1 ou 2 ou 3')
end

