
function I = int_13Simpson(xvalues)

    % xvalues -> vector [nin:step:nfin]
    
    I = 0;
    y = zeros(1,length(xvalues));
    integral_y = zeros(1,length(xvalues));
    h = (xvalues(1,length(xvalues))-xvalues(1,1))/(length(xvalues)-1);
    
    count = 1;
    for x = xvalues
        % aplicando a regra de 1/3 de simpson
        y(1,count) = 6+3*cos(x); % f(x)
        % atualizando o contador
        count = count + 1;
    end
    count = 1;
    for i = 1:(length(xvalues)-1)/2
        I = I + (1/3*h)*(y(1,count)+4*y(1,count+1)+y(1,count+2));
        % adicionando o valor da integral ao vetor de integral
        integral_y(1,count) = I;
        % atualizando o contador
        count = count+2;
    end
    
    %plot(xvalues,y);
    %legend('f(x)','Location','NorthWest');
    %13 FUNCIONA PARA INTERVALOS PARES E NUMERO IMPAR DE PONTOS
end
