function f = lagrange_linear(x,y,xx)

    for i = 1:length(x-1)
        if x(i) < xx && x(i+1) > xx
           x1 = x(i);
           y1 = y(i);
           x2 = x(i+1);
           y2 = y(i+1);
        end
    end

    f = (xx-x2)/(x1-x2)*y1 + (xx-x1)/(x2-x1)*y2;

end