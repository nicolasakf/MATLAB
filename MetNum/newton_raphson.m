
function [x,ea,it] = newton_raphson(f,x0,es)

    syms x
    df = diff(f);

    it = 0;
    itermax = 100;

    xrold = x0;

    while(1)
        a = double(f(xrold));
        b = double(df(xrold));
        xr = xrold - (a/b);
        it = it + 1;
        if xr ~= 0
            ea = abs((xr - xrold)/xr)*100;
        end
        if ea < es || it >= itermax
            x = xr;
            break;
        end
        xrold = xr;
    end
end