%Romberg

function [R,ea] = Romberg(a,b,itermax,es)
    Ea = [];
    I = zeros(10,10);
    n = 1;
    I(1,1) = Trap(a,b,n);
    iter = 0;
    while(1)
        iter = iter + 1;
        n = 2^iter;
        I(iter + 1,1) = Trap(a,b,n);
        for k = 2:(iter + 1)
            j = 2 + iter - k;
            I(j,k) = (4^(k-1)*I(j+1,k-1) - I(j,k-1))/(4^(k-1) - 1);
        end
        ea = abs((I(1,iter+1) - I(2,iter))/I(1,iter+1))*100;
        Ea(length(Ea) + 1) = ea;
        if iter > itermax
            break;
        end
    end
    R = I(1,iter+1);
    %disp(I);
    %fprintf('\nValor estimado = %.4f\n',Romberg);
    %fprintf('Erro aproximado = %.5f\n',ea);
    %fprintf('Numero de itera??es = %d\n',iter);
    %disp(Ea);
end

function Integral = Trap(a,b,n)
    h = (b - a)/n;
    f = [];
    for i = a:h:b
        f(length(f) + 1) = func(i);
    end
    sum = f(1);
    for i = 1:(n - 1)
        sum = sum + 2*f(i + 1);
    end
    
    sum = sum + f(n + 1);
    Integral = h*(sum/2);
end

function funcao = func(x)

    funcao = (x+1/x)^2;
    
end

