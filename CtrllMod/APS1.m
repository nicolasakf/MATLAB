% Controle Moderno - Lista #1

close all
clear
clc

%% EXERCICIO #2 - item c)

Km = 0.05;
R = 1.2;
L = 0.05;
Jm = 8E-4;
J = 0.02;
K = 500;
N = 12;

Je = (J + N^2*Jm);

A = [0  0   1   0   0;
     0  0   0   1   0;
     0  K/J 0  0   0;
     0  -(K/J+K/(N^2*Jm)) 0 0 Km/(N*Jm);
     0  0   -Km*N/L -Km*N/L -R/L];
 
B = [0 0 0 0 1/L]';

C = [1 0 0 0 0;
     N N 0 0 0];      

D = [0;0];


G = ss(A,B,C,D);
[num,den] = ss2tf(A,B,C,D);
G1 = tf(num(1,:),den(1,:));        % estou considerando duas saídas!
figure()
bode(G1)
t = 0:0.001:4;

v(1:round(length(t)/2)) = 3;
v(round(length(t)/2)+1:length(t)) = -3;
TL = zeros(1,length(t));           % não usaremos disturbios aqui mas já fica na modelagem! 

[y,t,x] = lsim(G,v',t);

figure();
plot(t,y(:,1),'r-')
hold on;
plot(t,y(:,2))
title('angulo e velocidade angular')
legend('Angulo','Velocidade')
xlabel('Tempo (s)')
ylabel('Angulo (rad), Velocidade (rad/s)')
grid on;

figure()
plot(t,x(:,3))
title('Corrente')
xlabel('Tempo (s)');
ylabel('Corrente (A)');
grid on;
  
%% EXERCICIO #3 - item b)

K1 = 3000;
K2 = 30000;
D = 600;
M = 300;
m = 50;
x10 = 1.5;
x20 = 0.75;
g = 9.81;

A = [0 0 1 0;
     0 0 0 1;
     -K1/M K1/M -D/M D/M;
     K1/m -(K1+K2)/m D/m -D/m];

B = [0 0 0;
     0 0 0;
     1/M 0 -g+K1*x10/M;
     -1/m K2/m -K1*x10/m-g+K2*x20/m];

C = [1 0 0 0;
     0 1 0 0];

D = [0 0 0;
     0 0 0];

G = ss(A,B,C,D);
t = 0:0.01:5;

%% CENARIO #1
u = zeros(length(t),1);
yR = zeros(length(t),1);
const = ones(length(t),1);
[y,t,x] = lsim(G,[u yR const],t,[1.5 .75 0 0]);

figure();
plot(t,y(:,1),t,y(:,2))
legend('x1','x2');
axis([0 5 0.5 1.5]);
xlabel('Tempo (s)');
ylabel('Estados (m)');
grid on;

%% CENARIO #2
x1ss = y(length(t),1);
x2ss = y(length(t),2);

u = zeros(length(t),1);

yR = zeros(length(t),1);
yR(1:25) = 0.15*ones(25,1);

const = ones(length(t),1);

[y,t,x] = lsim(G,[u yR const],t,[x1ss x2ss 0 0]);

figure();
plot(t,y(:,1),t,y(:,2))
legend('x1','x2');
axis([0 5 0.5 1.5]);
xlabel('Tempo (s)');
ylabel('Estados (m)');
grid on;

%% CENARIO #3
x1ss = y(length(t),1);
x2ss = y(length(t),2);

u = zeros(length(t),1);

yR = 0.05*sin((5+0*4)*t)+0.05*sin((5+1*4)*t)+0.05*sin((5+2*4)*t)+0.05*sin((5+3*4)*t)+0.05*sin((5+4*4)*t);

const = ones(length(t),1);

[y,t,x] = lsim(G,[u yR const],t,[x1ss x2ss 0 0]);

figure();
plot(t,y(:,1),t,y(:,2))
legend('x1','x2');
axis([0 5 0 1.5]);
xlabel('Tempo (s)');
ylabel('Estados (m)');
grid on;
