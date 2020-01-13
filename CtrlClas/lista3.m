%% Resolucaoo da Lista #3 (Controle Cl?ssico)
% V.Licks (Nov/17)

close all
clear
clc

%% ---------  Exercicio #3  ----------------

w = 0.01:0.01:1000;
G = zpk([-2],[0 -1 -4],100);
bode(G,w)
grid

fase = -163; % extraido da leitura do grafico no ganho 0 dB
pm = fase + 180;
zeta = pm/100;

wbw = 15;       % Extraido da leitura do gr?fico no ganho -7dB

Ts = (4/(wbw*zeta))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2))
Tp = (pi/(wbw*sqrt(1-zeta^2)))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2))
OS = exp(-zeta*pi/sqrt(1-zeta^2))*100

%% ------- Exercicio #4 -------------

wbw = 2;       % Extraido da leitura do gr?fico no ganho -7dB
zeta = 0.57;    % zeta = Pm/100

Ts = (4/(wbw*zeta))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2))
Tp = (pi/(wbw*sqrt(1-zeta^2)))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2))
OS = exp(-zeta*pi/sqrt(1-zeta^2))*100

%% ------- Exercicio #5 -------------

zeta = 0.2;    % zeta = Pm/100
OS = exp(-zeta*pi/sqrt(1-zeta^2))*100

%% ---------  Exerc?cio #6  ----------------
close all
clear all
clc

% ----- Sistema (a)
Ga01 = tf(0.1,[1 2]);      % K=0,1
Ga1000 = tf(1000,[1 2]);    % K=1.000
Ha = zpk([],[-4 -6],1);
figure(1)
bode(Ga01*Ha,Ga1000*Ha);
grid on;

% Vamos plotar ambos os Bodes com e sem o H(s) para ver o efeito
figure(2);
bode(Ga01,Ga01*Ha);
grid

% ----- Sistema (b)
Gb01 = zpk(roots([1 -4 13]),[-2 -4],0.1);      % K=0,1
Gb1000 = zpk(roots([1 -4 13]),[-2 -4],1000);    % K=1.000
Hb = zpk([],[0],1);
figure(3)
bode(Gb01*Hb,Gb1000*Hb);
grid on;

% Vamos plotar ambos os Bodes com e sem o H(s) para ver o efeito
figure(4);
bode(Gb01,Gb01*Hb);
grid

%%

w = 0.01:0.01:1000;
G = zpk([-10],[0],1);
bode(G,w)
grid
