function Ludecomp(a,b,n)

    % matriz a
    % matriz b
    % ordem da matriz (quadrada)

    tol = 0.001;
    x = [0,0,0];
    
    er = 0;
    
    o = zeros(1,n);
    s = zeros(1,n);
    
    Decompose(a, n, tol, o, s, er, b, x);
    
end

function Decompose(a, n, tol, o, s, er, b, x)
    for i = 1:n
        o(i) = i;
        s(i) = abs(a(i,1));
        for j = 2:n
            if abs(a(i,j)) > s(i)
                s(i) = abs(a(i,j));
            end
        end
    end
    for k = 1:(n-1)
        %Pivot(a, o, s, n, k);
        if abs(a(o(k),k)/s(o(k))) < tol
            er = -1;
            disp(a(o(k),k)/s(o(k)));
            break;
        end
        for i = (k + 1):n
            factor = a(o(i),k)/a(o(k),k);
            a(o(i),k) = factor;
            for j = (k + 1):n
                a(o(i),j) = a(o(i),j) - factor*a(o(k),j);
            end
        end
    end

    if abs(a(o(k),k)/s(o(k))) < tol
        er = -1;
        disp(a(o(k),k)/s(o(k)));
    end  

    for i = 2:n
        sum = b(o(i));
        for j = 1:(i - 1)
            sum = sum - a(o(i),j)*b(o(j));
        end
        b(o(i)) = sum;
    end
    x(n) = b(o(n))/a(o(n),n);
    for i = (n - 1):-1:1
        sum = 0;
        for j = (i + 1):n
            sum = sum + a(o(i),j)*x(j);
        end
        x(i) = (b(o(i)) - sum)/a(o(i),i);
    end
    
    disp(x);
end

function Pivot(a, o, s, n, k)
    p = k;
    big = abs(a(o(k),k)/s(o(k)));
    for ii = (k + 1):n
        dummy = abs(a(o(ii),k)/s(o(ii)));
        if dummy > big
            big = dummy;
            p = ii;
        end
    end
    dummy = o(p);
    o(p) = o(k);
    o(k) = dummy;
end


                
    