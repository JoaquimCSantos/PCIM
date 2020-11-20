% Computes the Mean Absolute Difference (MAD)
% Input
%       current : The block for which we are finding the MAD
%       reference : Reference block
%       n : the side of the two square blocks
%
% Output
%       cost : The MAD for the two blocks

function cost = getMAD(current,reference, n)


err = 0;
for i = 1:n
    for j = 1:n
        err = err + abs((current(i,j) - reference(i,j)));
    end
end
cost = err / (n*n);

