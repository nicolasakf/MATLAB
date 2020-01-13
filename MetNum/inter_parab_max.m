
function [xopt,ea,iter] = inter_parab_max(x0,x1,x2,es,itermax)

    % sempre x0 < x1 < x2 

    iter = 0;
    xr = x0;
    
    eavalues = [];

    while(1)
        
        xrold = xr;

        f0 = func(x0);
        f1 = func(x1);
        f2 = func(x2);
        a = f0*(x1^2 - x2^2) + f1*(x2^2 - x0^2) + f2*(x0^2 - x1^2);
        b = 2*f0*(x1 - x2) + 2*f1*(x2 - x0) + 2*f2*(x0 - x1);
        x3 = a/b;
        f3 = func(x3);

        if f3 > f1
            x0 = x1;
            x1 = x3;
            x2 = x2;
        else
            x2 = x1;
            x1 = x3;
            x0 = x0;
        end

        xr = x3;
        iter = iter + 1;

        if xr ~= 0
            ea = abs((xr - xrold)/xr)*100;
            eavalues(iter) = ea;
        end
        if ea < es || iter >= itermax
            xopt = xr;
            break;
        end
    end
    itervalues = 1:iter;
end

function y = func(x)
    y = - x^4 - 2*x^3 - 8*x^2 - 5*x;
end
