%% Aula 22 - Erro em Regime
% V.Licks (Nov/17)

%% -----  Exercicio #1 (Compensador de Atraso de Fase)
% Nise, 7ed, Exemplo 11.1, pg. 513)

clear;
clc;
close all;

OS = 20;                       % OS desejado, dado no enunciado

G = zpk([],[-100 -36 0],100);

disp('O zeta para um OS de 9,5% � ...');
zeta = (-log(OS/100))/(sqrt(pi^2+(log(OS/100))^2))

disp('A margem de fase necess�ria para alcan�ar este zeta � ...')
Pm = atan(2*zeta/(sqrt(-2*zeta^2+sqrt(1+4*zeta^4))))*(180/pi)       % o valor sai em graus

w = 0.01:0.01:1000;
bode(G,w);
grid;
[M,P] = bode(G,w);
disp('...logo, a fase de interesse �...')
Ph = -180+Pm       

for k=1:1:length(P);                % Procura no vetor de fase do Bode...    
    if P(k)-Ph <=0;                 % Se a fase � igual a fase necess�ria ...       
        ganho = M(k);                   % ... ent�o descobre o ganho naquela frequ�ncia
        K = 1/ganho;                    % ... e o ganho adicional para chegar a 0dB
        break;
    end
end

disp('A frequencia na fase de interesse � ...');
w(k)
disp('...e o ganho nesta frequ�ncia � de (dB)...');
20*log10(ganho)
disp('Precisamos aplicar um ganho de malha de...');
K

T = feedback(K*G,1);
figure();
step(T);
grid on;

