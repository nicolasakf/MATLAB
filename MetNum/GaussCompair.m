
%{

DESCRIPTION

This function compairs 4 different Gausian Elimination
methods, giving their results, aprox error for G. Seidel 
and flop counting for the others.

%}

function GaussCompair(A,B)

save GaussCompairVars

X_ref = A^(-1)*B

pause

fprintf('-------------------------- GaussNaive -------------------------------\n');
X_gnaive = GaussNaive(A,B,false)
fprintf('-------------------------- GaussPivot -------------------------------\n');
X_gpivot = GaussPivot(A,B,false)
fprintf('------------------------- GaussJordan -------------------------------\n');
X_gjordan = GaussJordan(A,B,false,false)
fprintf('------------------------- GaussSeidel -------------------------------\n');
X_gseidel = GaussSeidel(A,B,0.2,1,100,true)

pause

flop_counter('GaussCompairVars');

end