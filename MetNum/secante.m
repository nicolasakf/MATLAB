
% secante: @(x)(0.0074*x^4 - 0.284*x^3 + 3.355*x^2 -12.183*x + 5)
% a = primeiro valor
% b = segundo valor
% es = 0.0001

function [x,ea,it] = secante(f,a,b,es)

    it = 0;

    c = (a*f(b) - b*f(a))/(f(b) - f(a));
    disp('   Xn-1      f(Xn-1)      Xn      f(Xn)      Xn+1      f(Xn+1)');
    disp([a f(a) b f(b) c f(c)]);
    while abs(f(c)) > es
        a = b;
        b = c;
        c = (a*f(b) - b*f(a))/(f(b) - f(a));
        disp([a f(a) b f(b) c f(c)]);

        it = it + 1;

        if(it == 100)
            break;
        end
        
        ea = abs(f(c));
    end

    x = c;

end




