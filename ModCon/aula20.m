%% Aula 20 - PID
% by V.Licks (17/Out/16)

% Exercicio #0

s=tf('s');
G=1/(s*(10*s+2));
Kp=2.5;
Kd=8;
C=pid(Kp,0,Kd);
T=feedback(C*G,1);
step(T)
stepinfo(T)

%% Exercicio #1

% Parte 1- Resposta ao degrau em malha aberta
num=1;
den=[1000 300 30 1];
G=tf(num,den);
step(G)
stepinfo(G)

%% Parte 2 - ZN 2o metodo - Ajuste de Kp

Kcr=6; T=feedback(Kcr*G,1);step(T,150);
hold on;
Kcr=7; T=feedback(Kcr*G,1);step(T,150);
Kcr=7.5; T=feedback(Kcr*G,1);step(T,150);
Kcr=7.9; T=feedback(Kcr*G,1);step(T,150);

figure()
rlocus(G);   % para rootlocus, use FT malha aberta!
             % onde o locus cruza jw, ali esta Kcr
             % anote tambem wn - calcule fn, Tcr=1/fn

%% Parte 3 - Calcule os demais ganhos

Kcr=8; Pcr=36;

% P
Kp=0.5*Kcr;
Cpi=pid(Kp,0,0);
T=feedback(Cpi*G,1);
figure();
step(T);
hold on;

% PI
Kp=0.45*Kcr;
Ti=Pcr/1.2; Ki=Kp/Ti;
Cpi=pid(Kp,Ki,0);
T=feedback(Cpi*G,1);
step(T);

% PID
Kp=0.6*Kcr;
Ti=0.5*Pcr; Ki=Kp/Ti;
Td=0.125*Pcr; Kd=Kp*Td;
Cpid=pid(Kp,Ki,Kd);
T=feedback(Cpid*G,1);
step(T);

%% Parte 4 - ajuste fino dos ganhos PID
figure();
Cplus=pid(4.8,0.266,21.6);Tplus=feedback(Cplus*G,1);step(Tplus);
hold on;
Cplus=pid(4.8,0.266,30);Tplus=feedback(Cplus*G,1);step(Tplus);
Cplus=pid(4.8,0.266,40);Tplus=feedback(Cplus*G,1);step(Tplus);

%% Exercicio #2
% Parte 1- Resposta ao degrau em malha aberta

num=10;
den=[2 12 22 12];
G=tf(num,den);
step(G)
stepinfo(G)

%% Parte 2 - ZN 2o metodo - Ajuste de Kp

Kcr=9; T=feedback(Kcr*G,1);step(T,12);
hold on;
Kcr=10; T=feedback(Kcr*G,1);step(T,12);
Kcr=11; T=feedback(Kcr*G,1);step(T,12);
Kcr=11.7; T=feedback(Kcr*G,1);step(T,12);

figure()
rlocus(G);   % para rootlocus, use FT malha aberta!
             % onde o locus cruza jw, ali esta Kcr
             % anote tambem wn - calcule fn, Tcr=1/fn

%% Parte 3 - Calcule os demais ganhos

Kcr=12; Pcr=1.89;

% P
Kp=0.5*Kcr;
Cp=pid(Kp,0,0);
T=feedback(Cp*G,1);
figure();
step(T);
hold on;

% PI
Kp=0.45*Kcr;
Ti=Pcr/1.2; Ki=Kp/Ti;
Cpi=pid(Kp,Ki,0);
T=feedback(Cpi*G,1);
step(T);

% PID
Kp=0.6*Kcr;
Ti=0.5*Pcr; Ki=Kp/Ti;
Td=0.125*Pcr; Kd=Kp*Td;
Cpid=pid(Kp,Ki,Kd);
T=feedback(Cpid*G,1);
step(T);

%% Exercicio 2 - Parte 4 - ajuste fino dos ganhos PID
figure();
Cplus=pid(7.2,7.58,1.69);Tplus=feedback(Cplus*G,1);step(Tplus);
hold on;
Cplus=pid(7.2,7.58,2.3);Tplus=feedback(Cplus*G,1);step(Tplus);
Cplus=pid(7.2,7.58,3);Tplus=feedback(Cplus*G,1);step(Tplus);
