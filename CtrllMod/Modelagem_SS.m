%% EXEMPLO #1; item d)
close all
clear all
clc

R = 1;    %kg
L = .5;      % N.s/m
c = .5;     % N/m

A = [-R/L -1/L;
    1/c  0];
B = [1/L; 0];    
C = [0 1];
D = 0;

sys = ss(A,B,C,D);
step(sys);
grid on;
title('Resposta ao degrau do sistema em espaço de estados');

%% e)

[num,den] = ss2tf(A,B,C,D);
disp('Função de transferência correspondente [tecle algo]')
pause;
G = tf(num,den)          % compare a G(s) com aquela calculada em aula 

disp('Diagrama de Bode do sistema em malha aberta');
figure(2);
margin(G);