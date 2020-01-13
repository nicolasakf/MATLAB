%% Aula 19 - PID
% by V.Licks (13/Out/16)

% Exercicio #1

% Parte 1 - análise da resposta em malha aberta
s = tf('s');
G = 1/(s^2 + 10*s + 20);     % Planta
step(G)                      % Resposta ao degrau em malha aberta
stepinfo(G)
grid on;

%% Parte 2 - análise da resposta do controlador proporcional

Kp = 300;
C = pid(Kp)
T = feedback(C*G,1)

t = 0:0.01:2;
step(T,t)
hold on
step(G,t)

%% Parte 3 - Aumente o Kp e veja o que acontece

figure();
hold on;
grid on;

Kp = 100;C = pid(Kp);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp = 200;C = pid(Kp);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp = 300;C = pid(Kp);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)

%% Exercicio 1 - Parte 4 - Controlador PD

Kp = 300;     
Kd = 10;
C = pid(Kp,0,Kd)
T = feedback(C*G,1)

t = 0:0.01:2;
step(T,t)

%% Exercicio 1 - Parte 5 - Efeito do aumento de Kd

figure();
hold on;
grid on;
Kp=300;Kd=10;C=pid(Kp,0,Kd);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp=300;Kd=20;C=pid(Kp,0,Kd);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp=300;Kd=30;C=pid(Kp,0,Kd);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)

%% Exercicio 1 - Parte 6 - Controlador PI

Kp = 30;     
Ki = 70;
C = pid(Kp,Ki)
T = feedback(C*G,1)

t = 0:0.01:2;
step(T,t)

%% Exercicio 1 - Parte 7 - Aumentando Ki
figure();
hold on;
grid on;

Kp=30;Ki=70;C = pid(Kp,Ki);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp=30;Ki=90;C = pid(Kp,Ki);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)
Kp=30;Ki=110;C = pid(Kp,Ki);T = feedback(C*G,1);t = 0:0.01:2;step(T,t)

