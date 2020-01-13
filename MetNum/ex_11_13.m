
function x = ex_11_13 (A,B,relax)

    % item a) relax = 1
    % item b) relax = 1.2

    x = GaussSeidel(A,B,5,relax,100,true);

end