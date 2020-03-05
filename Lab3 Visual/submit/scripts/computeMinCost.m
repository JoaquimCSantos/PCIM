%Calcula minimos da matriz

function [dx, dy, min] = getMinCost(costs)

[row, col] = size(costs);

min = 27272;

for i = 1:row
    for j = 1:col
        if (costs(i,j) < min)
            min = costs(i,j);
            dx = j; dy = i;
        end
    end
end


