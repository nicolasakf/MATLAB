% Controle Moderno - Aula #5
% VL, Ago/18

close all
clear all

% Exercício #1: SS -> TF: Massa-mola-amortecedor 1 DOF

syms s       % cria a variavel simbolica s

m = 1000;    %kg
b = 50;      % N.s/m
k = 500;     % N/m

A = [0 1; -k/m  -b/m];
B = [0 1/m]';    % O ' indica transposta
C = [1 0];
D = 0;

I = [1 0 ; 0 1];

'G(s)' 
[num,den] = ss2tf(A,B,C,D);
G = tf(num,den)
%%
'Posso também calcular de forma simbolica p/ validar ....'
T = C*((s*I-A)^-1)*B+D;     % calcula a funcao de transferencia
pretty(T)       % Embeleza a funcao de transf

%% Exercício #2: SS -> TF (Nise, Ex 3.4, p.112)
% Precisa ter o Symbolic Math Toolbox instalado
clear all

A = [-4 -1.5; 4 0];
B = [2 ; 0];
C = [1.5 0.625];
D = 0;

G = ss(A,B,C,D);
G = tf(G)

