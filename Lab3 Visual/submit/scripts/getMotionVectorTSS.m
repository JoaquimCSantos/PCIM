% Computes motion vectors using Three Step Search method
%
% Input
%   imgP : The image for which we want to find motion vectors
%   imgI : The reference image
%   mbSize : Size of the macroblock
%   p : Search parameter  (read literature to find what this means)
%
% Ouput
%   motionVect : the motion vectors for each integral macroblock in imgP
%   TSScomputations: The average number of points searched for a macroblock
%


function [motionVect] = getMotionVectorTSS(imgP, imgI, mbSize, p)

[row col] = size(imgI);

vectors = zeros(2,row*col/mbSize^2);
%variavel para sabermos qual é o minimo custo da pesquisa 
costs = ones(3, 3) * 27272;

L = floor(log10(p+1)/log10(2));   
stepMax = 2^(L-1);

mbCount = 1;
for i = 1 : mbSize : row-mbSize+1
    for j = 1 : mbSize : col-mbSize+1


        x = j;
        y = i;
        
        %calculamos logo o central
        costs(2,2) = getMAD(imgP(i:i+mbSize-1,j:j+mbSize-1),imgI(i:i+mbSize-1,j:j+mbSize-1),mbSize);

        stepSize = stepMax;               

        while(stepSize >= 1)  

            % m -> vertical
            % n -> horizontal
            for m = -stepSize : stepSize : stepSize        
                for n = -stepSize : stepSize : stepSize
                    ySubSearch = y + m;   % row/Vert co-ordinate for ref block
                    xSubSearch = x + n;   % col/Horizontal co-ordinate
                    
                    %garantimos nao passamos dos limites imagem
                    if ( ySubSearch < 1 || ySubSearch+mbSize-1 > row || xSubSearch < 1 || xSubSearch+mbSize-1 > col)
                        continue;
                    end
                    
                    %sabemos qual é o nosso vetor
                    costRow = m/stepSize + 2;
                    costCol = n/stepSize + 2;
                    
                    %Assim nao fazemos o meio
                    if (costRow == 2 && costCol == 2)
                        continue
                    end
                    costs(costRow, costCol ) = getMAD(imgP(i:i+mbSize-1,j:j+mbSize-1),imgI(ySubSearch:ySubSearch+mbSize-1, xSubSearch:xSubSearch+mbSize-1), mbSize);
                    
                end
            end

            %dos 9 obtemos o minimo
            [dx, dy, min] = computeMinCost(costs);
            
            
            % Mudamos para o minimo

            x = x + (dx-2)*stepSize;
            y = y + (dy-2)*stepSize;
            
            stepSize = stepSize / 2;
            costs(2,2) = costs(dy,dx);
            
        end
        vectors(1,mbCount) = y - i;    % row co-ordinate for the vector
        vectors(2,mbCount) = x - j;    % col co-ordinate for the vector            
        mbCount = mbCount + 1;
        costs = ones(3,3) * 27272;
    end
end

motionVect = vectors;
                    