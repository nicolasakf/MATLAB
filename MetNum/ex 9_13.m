a = [1,1,-1;6,2,2;-3,4,1];
b = [-3;2;1];

xa = GaussNaive(a,b);
xb = GaussPivot(a,b);
xc = GaussJordan(a,b);