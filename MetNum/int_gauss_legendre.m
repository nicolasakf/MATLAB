
% QUADRATURA DE GAUSS

function I = int_gauss_legendre (matriz_cx,a,b)

    I = 0;

    [i,j] = size(matriz_cx);
    
    for i = [1:i]
       
       I = I + matriz_cx(i,1)*fx(matriz_cx(i,2),a,b);
       
    end
    
end

function fxnewval = fx(xd,a,b)

    x = ((b+a)+(b-a)*xd)/2;
    mult_dx = (b-a)/2;

    fxnewval = (x+1/x)^2*mult_dx; %f(x)

end
