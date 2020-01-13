
function [coefs,syx,r] = reg_lin_mult(x1,x2,y)

    % x1 => vetor de variaveis 1 - formato: (1,n)
    % x2 => vetor de variaveis 2 - formato: (1,n)
    % y => vetor imagem - formato: (1,n)
    
    % checking
    if size(x1) == size(x2) & size(x1) == size(y)
        disp('');
    else
        error('size of arrays x1, x2 and y must be equal');
    end
    
    [r,c] = size(x1);
    
    for i = 1:c, x1x2(1,i) = x1(1,i)*x2(1,i); end
    for i = 1:c, x1y(1,i) = x1(1,i)*y(1,i); end
    for i = 1:c, x2y(1,i) = x2(1,i)*y(1,i); end
    
    for i = 1:c, x1_2(1,i) = x1(1,i)^2; end
    for i = 1:c, x2_2(1,i) = x2(1,i)^2; end
    
    A = [c,sum(x1),sum(x2);
        sum(x1),sum(x1_2),sum(x1x2);
        sum(x2),sum(x1x2),sum(x2_2)];
    
    B = [sum(y);sum(x1y);sum(x2y)];
    
    coefs = GaussNaive(A,B,false); % coeficientes das retas de aproximacao (a0;a1;a2)
    
    for i = 1:c, srv(1,i) = (y(1,i)-coefs(1,1)-coefs(2,1)*x1(1,i)-coefs(3,1)*x2(1,i))^2; end
    sr = sum(srv);
    
    syx = sqrt(sr/(c-(2+1))); % erro padrao
    
    for i = 1:c, stv(1,i) = (y(1,i)-mean(y))^2; end
    st = sum(stv);
    
    r = sqrt((st-sr)/st);

end