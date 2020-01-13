function x = GaussSeidel(A,B,es,relax,maxit,numit)

    % A = coefficient matrix
    % B = right hand side vector
    % es = stop criterion (%)
    % relax = relaxing coef. value (must be [0;2], 1 = no relaxing, [0;1] xold prevail, [1;2] xnew prevail))
    % maxit = max iterations
    % x = solution vector

    % verifying if matriz is squared
    [m,n] = size(A);
    if m ~= n, error('Matrix A must be squared'); end
    if relax < 0 | relax > 2, error('relax value must be between 0 and 2'); end
    C = A;
    
    % verifying if diagonal is dominant
    if relax == 1
        for i = 1:n
            j = 1:n;
            j(i) = [];
            Z = abs(A(i,j));
            check(i) = abs(A(i,i)) - sum(Z); % Is the diagonal value greater than the remaining row values combined?
            if check(i) < 0
                fprintf('The matrix is not strictly diagonally dominant at row %2i\n\n',i)
                x = 'NaN';
                return
            end
        end
    end

    for i = 1:n
        C(i,i) = 0;
        x(i) = 0;
        ea(i) = 100;
    end
    x = x';
    
    for i = 1:n
        C(i,1:n) = C(i,1:n)/A(i,i);
        d(i) = B(i)/A(i,i);
    end
    
    iter = 0;
    while (1)
        xold = x;
        for i = 1:n
            x(i) = d(i)-C(i,:)*x; % calculating new x(i) value
            x(i) = relax*x(i)+(1-relax)*xold(i); % relaxing x value
            if x(i) ~= 0
                ea(i) = abs((x(i) - xold(i))/x(i)) * 100; % calculating new x(i) value
            end
        end
        iter = iter + 1;
        
        if max(ea) <= es | iter >= maxit, break; end % breaking conditions
        
    end
    
    % displaying other result parameters
    ea = ea'
    if numit, display(iter); end
    
end