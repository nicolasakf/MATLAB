
function ex_12_19(A,B)

xref = A^(-1)*B

x1 = GaussNaive(A,B,true)
x2 = GaussPivot(A,B,true)
x3 = GaussJordan(A,B,true,true)
x4 = GaussSeidel(A,B,0.02,1,100,true)

end