function [x,ea,it] = falsa_pos (fxvec,xli,xui,es)

    xu = xui;
    xl = xli;
    it = 0;
    ea = 1;
    xra = xl;

    while (ea > es)

        fxl = fxvec(1)*xl^3 + fxvec(2)*xl^2 + fxvec(3)*xl + fxvec(4);
        fxu = fxvec(1)*xu^3 + fxvec(2)*xu^2 + fxvec(3)*xu + fxvec(4);

        x = xu-((fxu*(xl-xu))/(fxl-fxu));
        fxr = -0.5*x^2 + 2.5*x + 4.5;

        if (fxr < 0)
          xl = x;
        else
          xu = x;
        end

        ea = abs((x-xra)/x);
        it = it + 1;
        
        xra = x;

    end

end