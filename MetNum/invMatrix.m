
function Ainv = invMatrix(A)

    [r,c] = size(A);
    if r~=c, error('matrix A is not squared'); end
    
    Ainv = zeros(r);
    I = eye(r);
    
    [L,U] = LUDecompOut(A);
    
    for i = 1:r
        D = GaussNaive(L,I(:,i),false);
        Ainv(:,i) = GaussNaive(U,D,false);
    end

end