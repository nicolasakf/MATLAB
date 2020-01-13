% Controle Moderno - Aula #9
% VL, SET/18

close all
clear all
clc

%% Exercicio #1 [Modelo 2x2] 

A = [0 1; 0 0];
B = [-1; 1];
C = [1  0];
D = 0; 

disp('Função de transferência de malha aberta');
G = ss(A,B,C,D);
tf(G)

% Queremos posicionar os polos em -1+j e -1-j
polos = [-1+j  -1-j];
disp('Os ganhos do regulador são...')
K = place(A,B,polos)

% O regulador (sistema em malha fechada) é ... 
disp('os autovalores do regulador são')
T = ss(A-B*K,[0; 0],C,D);       % note que B = [0; 0] pois o sistema é um 
                                % regulador, não possui entrada de referência!
eig(A-B*K)

% Vamos agora plotar a solução das equações de estado
[y,t,x] = initial(T,[1 0]);
plot(t,x(:,1),t,x(:,2));        % observe o comportamento 'regulador' que leva
                                % as variáveis de estado para zero!
legend('x1','x2');
grid on;

%% Exercicio #2: Sistema de posicionamento (Dutton, E2.27-2.28, p.99)
close all
clear all

%  Representação preservando significado fisico das variaveis de estado ...
A2 = [0 1 0; 0 -1 1; 0 0 -5];
B2 = [0; 0; 5];
C2 = [1 0 0];
D2 = 0;
disp('Funcao de transferencia')
G2 = tf(ss(A2,B2,C2,D2))
disp('Autovalores de A')
eig(A2)

%% Realimentando estados ...

%k11 = 1;      
%k12 = 1;
%k13 = 1;

% Ganhos para %OS=20% e Tr=1s
k11 = 10;
k12 = 2.8;
k13 = 1.2;

K = [k11 k12 k13];

Ac = A2 - B2*K; 
Cc = C2 - D2*K;         % aqui basta fazer a conta y = Cx + Du com u = r - Kx
                        % aqui, em particular, não faz diferença já que D=0
                      
disp('E os autovalores de Ac?')
eig(Ac)

t = 0:0.001:7;
r = ones(1,length(t));

T2 = ss(A2-B2*K,B2,C2-D2*K,D2);

[y,t,x] = lsim(T2,r,t,[0 0 0]);

plot(t,x(:,1),t,x(:,2),t,x(:,3));
legend('x1','x2','x3')
%[y,t,x] = step(Ac,B2,Cc,D2)       % podemos plotar a resposta ao degrau do sistema
grid on;                % note o erro em regime; aprenderemos a eliminá-lo nas
                        % próximas aulas!

knovo = place(A2,B2,ans)   % Curiosidade: o Matlab calcula os ganhos sozinho!
