% Controle Moderno - Aula #12
% VL, SET/18

%% Exercicio #1 - Controlabilidade (Dutton E5.4, p365)

close all
clear all
clc

A = [-3 1; -2 1.5];
B = [1; 4];

disp('Autovalores ...')
eig(A)

% � control�vel? 
Q = ctrb(A,B);
rank(Q)         % se o rank(Q)<2, n�o control�vel 

% ...mas ser� que consigo mover o p�lo inst�vel de +1 para s = -4?
polos = [-2.5 -4];
K = place(A,B,polos)
% checando para ver se autovalores de (A-BK)caem em -2.5 e -4 ...
eig(A-B*K)

%% Exercicio #2 - Teste de PBH (Dutton E5.4, p365)
clc;

A = [-3 1; -2 1.5];
B = [1; 4];

disp('Vamos ver os autovalores ...')
A = [-3 1; -2 1.5];
B = [1; 4];
lambda = eig(A)         % salva os autovalores de A no vetor lambda

disp('Vamos testar se estes autovalores s�o control�veis usando o teste PBH')
for k = 1:2
    S = [A-lambda(k)*eye(2)  B];      % monta matriz particionada S
    rank(S)
end

%% (Improviso sobre Dutton, Ex5.3, p.317)
% A controlabilidade � uma caracter�stica da realiza��o e n�o do sistema! 
% Assim, se eu passar o sistema para realiza��o can�nica control�vel, a
% nova realiza��o passar� a ser control�vel! 

A = [-1 3; 0 2];
B = [1; 1];
C = [1 0];
D = 0;

eig(A)
rank(ctrb(A,B))        % veja aqui que o rank � 1, logo n�o-control�vel

[num,den] = ss2tf(A,B,C,D);         % vamos agora passar para TF ...
[A1,B1,C1,D1] = tf2ss(num,den);     % e depois para SS (Matlab bota na
                                    % forma can�nica ... 

disp('Agora, na nova forma, o sistema � control�vel?')
rank(ctrb(A1,B1))                   % rank() = 2, � control�vel! 

disp('Mas � tamb�m observ�vel?')
rank(obsv(A1,C1))                   % um sistema se tornou control�vel mas
                                    % agora perdeu a observabilidade! 


%% Exercicio #3(a) - insight sobre controlabilidade (Friedland, E5A, p.190)
clc

A = [-1 0 0 0;
    0 -2 0 0;
    0 0 -3 0;
    0 0 0 -4];
B = [1; 0; 1; 0];
C = [1 1 0 0];
D = 0;

disp('Qual o rank da matriz de controlabilidade?')
rank(ctrb(A,B))         % claramente o sistema n�o � control�vel 
%%
lambda = eig(A)         % salva os autovalores de A no vetor lambda

disp('Vamos testar se estes autovalores s�o control�veis usando o teste PBH')
for k = 1:4
    S = [A-lambda(k)*eye(4)  B];      % monta matriz particionada S
    rank(S)
end
%%
disp('Ou seja, os modos control�veis est�o associados com -3 e -1')

% vamos calcular a fun��o de transfer�ncia ...
syms s
I = eye(4);

G = C*(s*I-A)^-1*B        % vamos calcular a fun��o de transfer�ncia ...

%% plotar este trecho depois de rodar o Simulink A12E1
subplot(2,1,1);
plot(yss);
ylim([0 1.1])
grid on;
title('Sa�da y(t) do Simulink')

subplot(2,1,2);
H = tf(1,[1 1]);
step(H,10)
ylim([0 1.1])
grid on;
title('Sa�da y(t) da F.T. de primeira ordem')

%% Exercicio #3(b) - insight sobre controlabilidade (Friedland, E5A, p.190)
clc

A1 = [2 3 2 1;
    -2 -3 0 0;
    -2 -2 -4 0;
    -2 -2 -2 -5];
B1 = [1; -2; 2; -1];
C1 = [7 6 4 2];
D1 = 0;

disp('Qual o rank da matriz de controlabilidade?')
rank(ctrb(A1,B1))         % claramente o sistema n�o � control�vel 

%%
lambda = eig(A1)         % salva os autovalores de A no vetor lambda
disp('Vamos testar se estes autovalores s�o control�veis usando o teste PBH')
for k = 1:4
    S = [A1-lambda(k)*eye(4)  B1];      % monta matriz particionada S
    rank(S)
end
%%
disp('Ou seja, os modos control�veis est�o associados com -3 e -1')

% vamos calcular a fun��o de transfer�ncia ...
syms s
I = eye(4);
%%
G1 = C1*(s*I-A1)^-1*B1;        % vamos calcular a fun��o de transfer�ncia ...
simplify(G1)
%%

[P,D] = eig(A1);      % P contem os autovetores nas colunas e D os autovalores

T = [P(:,2) P(:,3) P(:,4) P(:,1)];    % o matlab muda a ordem dos autovalores 
                                      % e autovetores, ent�o tenho que
                                      % permutar as colunas para fazer
                                      % sentido
A1d = inv(T)*A1*T;
B1d = inv(T)*B1;
C1d = C1*T;
[num,den] = ss2tf(A1d,B1d,C1d,0);
G1 = tf(num,den)
zpk(G1)                               % vc consegue ver as oportunidades para cancelar polos e zeros?

%% plotar este trecho depois de rodar o Simulink A12E2
subplot(2,1,1);
plot(yss2);
ylim([0 1.1])
grid on;
title('A12E2 - Sa�da y(t) do Simulink')

subplot(2,1,2);
H = tf(1,[1 1]);
step(H,10)
ylim([0 1.1])
grid on;
title('Sa�da y(t) da F.T. de primeira ordem')

