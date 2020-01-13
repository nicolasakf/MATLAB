% Controle Moderno - Prova_1
% Nicolas Fonteyne

close all
clear

% Funcoes Uteis
% ss
% tf
% ss2tf e tf2ss
% poly: polinomio = poly([raizes do polinomio])
% roots: contrario de poly
% eye: matriz I nxm = eye(n,m)
% syms s: define incognita s para o script
% place: matriz ganhos K = place(A, B, [polos desejados])
% eig: vetor dos autovalores da matriz = eig(A)
% ctrb: matriz de controlabilidade [A^nB,...] = ctrb(A,B)
% rank: numero de colunas linearmente independentes da matriz A = rank(A)

%% Conversao TF <=> SS

syms s

A = [0 1; 0 -1];
B = [0; 1];
C = [1 0];
D = 0;
I = eye(size(A));

% SS para TF
% Metodologia 1
G = ss(A,B,C,D);
G = tf(G);
% Metodologia 2
[num, den] = ss2tf(A,B,C,D);
G = tf(num, den);
% Metodologia 3
T = C*((s*I-A)^-1)*B+D;
pretty(T)

% TF para SS
num = [20];
den = [1 2 4];
[A,B,C,D] = tf2ss(num, den);

%% Alocacao Polos

polos = [-1+j  -1-j];
K = place(A,B,polos);

eig(A-B*K) % vetor dos autovalores da matriz (lambda 1,2,3,...)

%% Fechar Malha
T = ss(A-B*K,B,C,D);

%% Teste PBH

lambda = eig(A);         % salva os autovalores de A no vetor lambda

disp('Vamos testar se estes autovalores são controláveis usando o teste PBH')
for k = 1:2
    S = [A-lambda(k)*eye(2)  B];      % monta matriz particionada S
    rank(S)
end
