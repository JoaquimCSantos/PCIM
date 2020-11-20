%--------------------------------------%
%      Código relativo ao 1            %                                   
%--------------------------------------%

clc
clear
close all

T = 1/440;
f = 1/T; 
A = 5000;
Fs =22050;
t=[0:1/Fs:T];
x = 0;
xs = [0:1:50];
N=5;

for k=1:N
  x =x -((2*A)/(pi*k))*sin(((2*pi)/T)*k*t);
end
plot(t, x);
hold on;
title('N = 5')

