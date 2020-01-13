% Controle Moderno - P1 
% V.Licks, Set/18

%% Questão #2
clear all
clc

disp('A equação característica...')
poly([-2 -3 -4])
disp('A matriz A ...')
A = [0 1 0; 0 0 1; -24 -26 -9];
disp('Os autovalores da matriz A...')
eig(A)

%% Questão #3
clc
clear all

syms s k m1 m2
A = [0 -k/m1 0 k/m1; 1 0 0 0; 0 k/m2 0 -k/m2; 0 0 1 0];
B = [1/m1 0 0 0]';
C = [0 1 0 0];
D = 0;
I = eye(4);
disp('A função de transferência ...')
G = C*inv(s*I-A)*B

%% Questão #4
clc
clear all

A = [0 1; 7 -4];
B = [1;2];
C = [1 3];
D = 0;

% parte (b)
disp('autovalores de A...')
eig(A)

% parte (c)
disp('det(Q)')
det(ctrb(A,B))

% parte (d)
[num,den]=ss2tf(A,B,C,D);
disp('Funcao de transferencia...')
G = tf(num,den)


%% Questão #5
clc
clear all

A = [1 1 0; 0 -1 1; 13 -1 -2];
B = [2 -1 -2]';
C = [1 1 0];
D = 0;

% Parte (a)
disp('Quais os autovalores de A?')
eig(A)

%% Parte (b)
disp('É controlável?')
Q = ctrb(A,B);
rank(Q)

%% Parte (c)
% Posição desejada dos pólos
polos = [-3 -2+j*2 -2-j*2];

% Vamos achar o valor dos ganhos do compensador
disp('Ganhos do regulador')
K = place(A,B,polos)

% Vamos verificar que os polos em malha fechada estão corretos
disp('os polos em malha fechada são ...')
eig(A-B*K)

%% Parte (d)
% resposta ao degrau em malha fechada
step(A-B*K,B,C,D);          % Vemos que o sistema não tem erro zero em regime

%% Parte (e)

Ai = [A [0 0 0]'; -C 0];     % primeiro, colocamos as matrizes no formato estendida
Bi = [B; 0];
polos = [-30 -3 -2+j*2 -2-j*2];

% Os ganhos do controlador com ação integral
K1 = place(Ai,Bi,polos)

% os autovalores do sistema em malha fechada
disp('Os autovalores do sistema em malha fechada...')
eig([A-B*K1(1:3) -B*K1(4); -C 0])


%% Parte (f)
% resposta ao degrau do sistema em malha fechada
step([A-B*K1(1:3) -B*K1(4); -C 0],[[0 0 0]';1],[C 0],0)
title('Resposta ao degrau do sistema em malha fechada') 

