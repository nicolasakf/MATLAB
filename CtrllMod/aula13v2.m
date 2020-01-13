% Moderno - Aula 13
% V.Licks, Set/18

%% EXERCÍCIO #1 - Motor DC (Franklin, Ex. 7.18, pg 495)
close all
clear all
clc

A = [0 1; 0 -1];
B = [0; 1];
C = [1 0];
D = 0;

G = ss(A,B,C,D);

polos = [-2 -2];

K = acker(A,B,polos);

T = ss(A-B*K,B,C,D);

% Introdução da referência
[y,t,x] = step(T);
u = (ones(1,length(t))- K*x')';
figure(1)
plot(t,x(:,1),t,x(:,2),t,u);
title('Sem correção para ess')
legend('x1','x2','u');
grid on;

% Introdução da referência com pré-filtro
N = inv([A B; C D])*[0 0 1]';
Nx = N(1:2);
Nu = N(3);
Nbar = Nu+K*Nx;
figure(3)
Tn2 = ss(A-B*K,Nbar*B,C,D);
[y,t,x] = step(Tn2);
u = (Nbar*ones(1,length(t))- K*x')';
%plot(t,x(:,1),t,x(:,2),t,u);       % Se quiser incluir u(t) nos gráficos
%legend('x1','x2','u');             % Se quiser incluir u(t) nos gráficos
plot(t,x(:,1),t,x(:,2));
legend('x1','x2');
title('Malha fechada com u = -Kx + Nbar*r')
grid on;

%% EXERCICIO #2 - Sistema Tipo 0
close all
clear all
clc

% Agora, vamos considerar um outro sistema, que não tenha polo na origem!

[A,B,C,D] = tf2ss(1,poly([-3 -2 -1]));
Gss = ss(A,B,C,D);
polos = [-1+j -1-j -4];
K = place(A,B,polos)

% Fecha a malha com u=r-Kx
T = ss(A-B*K,B,C,D);
figure(1)
step(T)
grid on;
title('Malha fechada com u=r-K*x')

N = legend('x1','x2','u');

N = inv([A B; C D])*[0 0 0 1]';
Nx = N(1:3);
Nu = N(4);
%Nbar = N(4)+K*N(1:3);
Nbar = Nu+K*Nx;
Tn = ss(A-B*K,B*Nbar,C,D);      % u = -Kx + Nbar*r
%figure(2)
%step(Tn)
%grid on;
%title('Malha fechada com u = -Kx + Nbar*r')
[y,t,x] = step(Tn);
figure(2)
plot(t,x(:,1),t,x(:,2),t,x(:,3));
legend('x1','x2','x3');
title('Malha fechada com u = -Kx + Nbar*r')
grid on

figure(3)
u = (Nbar*ones(1,length(t))- K*x')';
plot(t,u);
legend('u');
title('Esforço de controle')
grid on

%% SERÁ QUE NOSSO CONTROLADOR É ROBUSTO A MUDANÇAS NA PLANTA? 
% Digamos que a planta mude, o pólo que estava em -3 agora vai para -5

[A,B,C,D] = tf2ss(1,poly([-5 -2 -1]));
Tn = ss(A-B*K,B*Nbar,C,D);
figure(4)
%step(Tn)
%grid on
[y,t,x] = step(Tn);
plot(t,x(:,1),t,x(:,2),t,x(:,3));
legend('x1','x2','x3');
title('Malha fechada com u = -Kx + Nbar*r')
grid on

%% EXERCÍCIO #3 - Motor DC da Aula 4
close all
clear all
clc

Kt = 0.05;      % N.m/A
R = 1.2;        % ohms
L = 0.05;       % H
JL = 0.02;      % kg.m^2  
Jm = 8E-4;      % kg.m^2 
N = 12;

Je = JL + (N^2)*Jm;   % inercia percebida no eixo da carga

A = [0 1 0; 0 0 N*Kt/Je; 0 -N*Kt/L -R/L];
B = [0; 0; 1/L];
C = [1 0 0];
D = [0];

polos = [-3+j*3  -3-j*3  -24];

K = place(A,B,polos);

T = ss(A-B*K,B,C,D);

% Resposta ao degrau com u = r - Kx
figure(1)
step(T)
grid on;
title('Resposta ao degrau com u = r - Kx');

% Daqui saem as matrizes [Nx; Nu] !
N = inv([A B; C D])*[zeros(3,1); 1];

% para eliminar o erro em regime ... 
Tn = ss(A-B*K,B*K(1),C,D);
[y,t,x] = step(Tn,3);
Nbar = N(4)+K*N(1:3); 
u = (Nbar*ones(1,length(t))- K*x')';

figure(2)
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,u);
legend('x1','x2','x3','u');
grid on
title('Resposta ao degrau com u = -K*x + Nbar*r');

