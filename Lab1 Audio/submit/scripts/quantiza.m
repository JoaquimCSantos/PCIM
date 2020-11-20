function [y] = quantiza( sinal, N)
    M = N / 2;
    n = 2^(N-1);
    y = floor( n * sinal + 0.5)/n ;
end

