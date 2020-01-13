% Controle Moderno - Aula #14
% VL, Set/18

%% EXERCICIO #1
close all
clear all
clc

A = [0 1; 0 -1];
B = [0; 1];
C = [1 0];
D = 0;

% Malha aberta para calcular os ganhos com acker
Aa = [A [0;0]; -C 0];
Ba = [B; 0];
Ca = [C 0];
Da = 0;

polos = [-2 -2 -10];
Ka = acker(Aa,Ba,polos);

%%
Br = [0;0;1];

T = ss(Aa-Ba*Ka,Br,Ca,0);

[y,t,x] = step(T,5);

plot(t,x(:,1),t,x(:,2),t,x(:,3));
legend('x1','x2','xi');
grid on;

%% EXERCICIO #2 - Projeto de controlador com e sem acao integral: comparacao
% (Nise, 7a, E12.10, p.571)

close all
clear all
clc

A = [0 1; -3 -5];
B = [0; 1];
C = [1 0];
D = 0;

% PARTE (a)
OS = 10;                                         % Define %OS desejado
zeta = -log(OS/100)/sqrt(pi^2+(log(OS/100))^2);   % calcula zeta equiv

Ts = 0.5;          % valor dado
preal = 4/Ts;       % Ts = 4/(zeta*wn) = 4/(parte real do polo)
wn = preal/zeta;    % calcula a frequencia natural
pimag = wn*sqrt(1-zeta^2);   % parte imaginaria do polo

disp('O polinomio caracteristico ...')
den = conv([1 8+j*10.91],[1 8-j*10.91])

polos = [-8+j*10.91 -8-j*10.91];

disp('Os ganhos do controlador de realimentacao de estados...')
K = place(A,B,polos)

Ta = ss(A-B*K,B,C,D);

figure(1)
[y,t,x] = step(Ta);
plot(t,x(:,1),t,x(:,2));
grid on;

figure(2)
plot(t,y);
grid on

disp('Erro em regime permanente para entrada degrau...')
ess = 1 + [1 0]*inv([0 1; -183.1 -16])*[0 ; 1]

%% Parte (b) - Controle com ação integral
Aa = [A [0;0]; -C 0];
Ba = [B; 0];
Ca = [C 0];
Da = 0;

polos = [-8+j*10.91 -8-j*10.91 -100];

Ka = acker(Aa,Ba,polos);

Br = [0;0;1];

T = ss(Aa-Ba*Ka,Br,Ca,Da);

[y,t,x] = step(T);

figure(3)
plot(t,x(:,1),t,x(:,2),t,x(:,3));
legend('x1','x2','xi');
grid on;

%% EXERCICIO #3

close all; 
clear all;

A=[0  1  0; 0  -1  1; 0  0  -5]; 
B=[0  0  5]'; 
C=[1  0  0]; 
D=0;

polos = [-1+j*2 -1-j*2 -10 -30];

Aa = [A [0;0;0]; -C 0];
Ba = [B; 0];
Ca = [C 0];
Da = 0;

Ka = acker(Aa,Ba,polos);

Br = [0;0;0;1];

T = ss(Aa-Ba*Ka,Br,Ca,Da);

[y,t,x] = step(T);

figure(1)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4));
legend('x1','x2','x3','xi');
grid on;
