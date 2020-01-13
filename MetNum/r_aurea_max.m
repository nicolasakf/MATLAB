
function [xopt,ea,iter] = r_aurea_max(xlow,xhigh,itermax,es)

    %xlow => limite inferior inicial
    %xhigh => limite superior inicial
    %itermax => numero maximo de iteracoes permitidas
    %es => erro aceitavel (%)
    
    R = (5^(0.5) - 1)/2;
    xl = xlow;
    xu = xhigh;
    iter = 1;
    d = R*(xu - xl);
    x1 = xl + d;
    x2 = xu - d;
    f1 = func(x1);
    f2 = func(x2);
    
    eavalues = [];
    
    if f1 > f2
        xopt = x1;
    else
        xopt = x2;
    end
    
    while(1)
        d = R*d;
        if f1 > f2
            xl = x2;
            x2 = x1;
            x1 = xl + d;
            f2 = f1;
            f1 = func(x1);
        else
            xu = x1;
            x1 = x2;
            x2 = xu - d;
            f1 = f2;
            f2 = func(x2);
        end

        if f1 > f2
            xopt = x1;
        else
            xopt = x2;
        end
        if xopt ~= 0
            ea = (1 - R)*(abs((xu - xl)/xopt))*100;
            eavalues(iter) = ea;
        end
        if (ea <= es) | (iter >= itermax)
            break;
        end
        
        iter = iter + 1;
        
    end
    
    itervalues = 1:iter;
    %if plotbool, plot(itervalues,eavalues); end
    
    r_aur = xopt;
    
    %calculo de h
    h = 0.5/(pi*r_aur^2);
end

function y = func(x)

    y = - x^4 - 2*x^3 - 8*x^2 - 5*x;
end