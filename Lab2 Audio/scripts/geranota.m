function x = geranota(nota, duracao, Fs)
    

    T0 = 1.0/(440*nota);
    A = 5000;
    N=5;
    t=[0:1/Fs:duracao];
    x = 0;
    
    for k=1:N
      x =x -((2*A)/(pi*k))*sin(((2*pi)/T0)*k*t);
    end
    
    %Verificar tamanho
    n = length(x);
    %garante que o seno vai de [0,pi/2]=> [0,1] e de [pi/2,0]=> [1,0] 
    u=(pi/2)/((1/10)*n);
    %inicio do ultimo 1/10
    f = round(n - (1/10)*n+0.5);
    
    %faz 1 decimo
    for i=1:(1/10)*n
           %fazemos o primeiro decimo
         x(i)=sin(u*i)*x(i);
            %fazemos o ultimo decimo garantimos que vai ao 2 quarto
         x(f +i)=sin(pi/2+u*i)*x(f +i);
    end
    amostras = x;
end