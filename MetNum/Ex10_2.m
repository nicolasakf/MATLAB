% matrizes

A = [10,2,-1;-3,-6,2;1,1,5];
B = [27;-61.5;-21.5];

% a)

display('item a)');

[L,U] = LUDecompOut(A);

% checking
display('checking if L*U = A');
display(L*U);

%% b)

display('item b)');

Ludecomp(A,B,3);

%% c)

display('item c)');

Blinha = [12,18,-6];

Ludecomp(A,Blinha,3);