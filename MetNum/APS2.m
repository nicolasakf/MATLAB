% APS 2 - Exs. 10.3, 10.6 e 10.22
% N?colas Fonteyne - 6 MECAT

%% 10.3)

display('Ex 10.3)');

A = [8,4,-1;-2,5,1;2,-1,6];
B = [11;4;7];
n = 3;

% item a)

display('item a)');

Ludecomp(A,B,n);

% Obs.: o comando de pivotamento foi comentado no c?digo fonte para atender
% aos requisitos do enunciado da quest?o.

% item b)

display('item b)');

[L,U] = LUDecompOut(A);

coluna1 = [1;0;0];
coluna2 = [0;1;0];
coluna3 = [0;0;1];
Ainv = [];

D = GaussNaive(L,coluna1,false);
X = GaussNaive(U,D,false);
Ainv(1:n,1) = X;

D = GaussNaive(L,coluna2,false);
X = GaussNaive(U,D,false);
Ainv(1:n,2) = X;

D = GaussNaive(L,coluna3,false);
X = GaussNaive(U,D,false);
Ainv(1:n,3) = X;

Ainv
I = Ainv*A

X = Ainv*B

%% 10.6)

display('Ex 10.6)');

A = [10,2,-1;-3,-6,2;1,1,5];
B = [27;-61.5;-21.5];
    
[L,U] = LUDecompOut(A);

coluna1 = [1;0;0];
coluna2 = [0;1;0];
coluna3 = [0;0;1];
Ainv = [];

D = GaussNaive(L,coluna1,false);
X = GaussNaive(U,D,false);
Ainv(1:n,1) = X;

D = GaussNaive(L,coluna2,false);
X = GaussNaive(U,D,false);
Ainv(1:n,2) = X;

D = GaussNaive(L,coluna3,false);
X = GaussNaive(U,D,false);
Ainv(1:n,3) = X;

Ainv
I = Ainv*A

X = Ainv*B

%% 10.22)

display('Ex 10.22)');

%{
Para resolver o problema, foram efetuados ambos os produtos vetoriais v1 = A x B
e v2 = A x C, e depois foram somados v3 = v1 + v2. O vetor v3 foi ent?o
equiparado com o "vetor resposta" - posto ao lado diretito da equa?ao - e
seus valores equiparados para dire?oes i, j e k, chegando, por fim, ao
sistema de equa?oes descrito pelas matrizes A e B, abaixo.
%}

A = [-5,-2,-4;2,-3,-1;4,1,4];
B = [6;-2;1];

X = GaussNaive(A,B,false)
