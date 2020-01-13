
function x = GaussNaive(a,b,numit)

    iter = 0;

    ab = [a,b]; %matriz dos coeficientes + matriz resposta
    [R,C] = size(ab);
    
    if R+1 == C

        %eliminacao progressiva
        for j = 1:C-1 %percore todas as colunas da matriz A
            for i = j+1:R %percorre as linhas da matriz A [2 a R],[3 a R],[4 a R],...
                ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
                iter = iter + 1;
            end
        end

        %matriz solucao
        x = zeros(R,1);
        x(R) = ab(R,C)/ab(R,R); %ja substitui o ultimo termo

        %substituicao regressiva
        for i = R-1:-1:1
            x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
        end
        
    else
        display('error: matrix isnt squared');
    end

    if numit
        display(iter);
    end
    
    %et = [(-0.25-x(1,1))/-0.25; (-0.5-x(2,1))/-0.5;(2.25-x(3,1))/2.25];
    %display(et);
    
end
