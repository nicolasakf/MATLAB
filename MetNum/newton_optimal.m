
function [xopt,ea,iter] = newton_optimal(x0,es,itermax)

    iter = 0;
    xr = x0;

    while(1)
        
        xrold = xr;
        a = func_ponto(xrold);
        b = func_2pontos(xrold);
        xr = xrold - (a/b);
        
        iter = iter + 1;
        
        if xr ~= 0
            ea = abs((xr - xrold)/xr)*100;
        end
        
        if ea < es || iter >= itermax
            xopt = xr;
            break;
        end
    end
end

function f1 = func_ponto(x) % derivate of optamizing funtion
    f1 = - 4*x^3 - 6*x^2 - 16*x - 5;
end

function f2 = func_2pontos(x) % 2nd derivate of optamizing funtion
    f2 = - 12*x^2 - 12*x - 16;
end
