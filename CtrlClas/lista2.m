%% ---- EXERCICIO #1

close all;
clear;
clc;

% SISTEMA NAO COMPENSADO
numG = 1;
denG = poly([-1 -1 -10]);
G = tf(numG,denG);
rlocus(G);
zeta = 0.6;
sgrid(zeta,0);
disp('zoom e clique algo');
pause;
%outputs
[k,p]=rlocfind(G)
os = find_os(zeta)
Ts = -4/real(p(2)) % usar polos dominantes para esse calculo
Kp = dcgain(k*G)
ess = 1/(1+Kp) % ess p/ entrada em degrau

% SISTEMA COMPENSADO
disp('Clique para compensar sistema com PI');
pause;
numGc = [1 0.1];
denGc = [1 0];
Gc = tf(numGc,denGc);
rlocus(Gc*G);
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[kcomp,pcomp]=rlocfind(Gc*G)
os_comp = find_os(zeta)
Tscomp = -4/real(pcomp(2))
Kpcomp = dcgain(kcomp*Gc*G)
ess_comp = 1/(1+Kpcomp) % ess p/ degrau

%% ---- EXERCICIO #2

close all;
clear all;
clc;

os = 10;                                    
zeta = find_zeta(os);

% SISTEMA NAO COMPENSADO
numG = 1;
denG = poly([-2 -3 -7]);
G = tf(numG,denG);
rlocus(G);
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[k,p]=rlocfind(G)
Kp = dcgain(k*G) % item a)         

% SISTEMA COMPENSADO
disp('Clique para compensar sistema com atraso de fase')
pause;
% calcular a relacao kp_desejado/kp_atual = zc/pc [arbitrar pc]
% Gc = (s+zc)/(s+pc)
numGc = [1 0.041];
denGc = [1 0.01];
Gc = tf(numGc,denGc);               
rlocus(Gc*G);                       
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[katraso,patraso]=rlocfind(Gc*G) % item b)

% item c)
T = feedback(k*G,1); % malha fechada do sist nao compensado
Tatraso = feedback(katraso*Gc*G,1); % malha fechada do sist compensado
step(T);
figure();
step(Tatraso);

%% ---- EXERCICIO #3

close all;
clear all;
clc;

zeta = 0.707;

numG = [1 6];
denG = poly([-2 -3 -5]);
G = tf(numG,denG);
rlocus(G);
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[k,p]=rlocfind(G)
os = find_os(zeta)

%% Calcular a contribui??o angular dos polos e zeros de G(s) no ponto
% 4.62+j4.62
theta1 = radtodeg(atan(4.62/(6-4.62)));
theta2 = radtodeg(atan(4.62/(5-4.62)));
theta3 = 180-radtodeg(atan(4.62/(4.62-3)));
theta4 = 180-radtodeg(atan(4.62/(4.62-2)));
angulo = theta1-theta2-theta3-theta4;
contrib_zero = 180 - angulo

disp('LGR do sistema compensado - zoom e tecle')
pause;

numGc = [1 7.2];
denGc = 1;
Gc = tf(numGc,denGc);

rlocus(Gc*G);
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[kc,pc]=rlocfind(Gc*G)

pause;
Tc = feedback(kc*Gc*G,1);
step(Tc);
stepinfo(Tc)    

%% ---- EXERCICIO #4

close all;
clear;
clc;

numG = 1;
denG = poly([-5 -5 -5]);
G = tf(numG,denG);

zeta = find_zeta(15);

numGc = [1 1];
denGc = [1 5.07];
Gc = tf(numGc,denGc);
rlocus(Gc*G);
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[kc,pc]=rlocfind(Gc*G)

Tc = feedback(kc*Gc*G,1);
ltiview(Tc);

%% ---- EXERCICIO #5

close all;
clear;
clc;

numG = 1;
denG = poly([-2+2i,-2-2i,-10]);
G = tf(numG,denG);
rlocus(G);
zeta = find_zeta(10);
sgrid(zeta,0);
disp('Zoom e tecle qualquer coisa')
pause;
[k,p] = rlocfind(G)
pause;
% incluindo o compensador de avan?o
numGlead = [1 3];
denGlead = [1 14.47];
Glead = tf(numGlead,denGlead);
rlocus(Glead*G);
sgrid(zeta,0);
disp('Zoom e tecle qualquer coisa')
pause;
[klead,plead] = rlocfind(Glead*G)

Kp = dcgain(klead*Glead*G)        % constante de erro Kp compensado

%% por fim, vamos simular a resposta ao degrau do sistema em malha fechada

numGlag = [1 0.465];
denGlag = [1 0.01];
Glag = tf(numGlag,denGlag);

Tleadlag = feedback(1337*Glag*Glead*G,1);
ltiview(Tleadlag);

%% ---- EXERCICIO #6

close all;
clear;
clc;

numG = 1;
denG = poly([0 -5 -11]);
G = tf(numG,denG);
rlocus(G);

os = 0.3;                                      % os = 30%
zeta = sqrt(((log(os))^2)/(pi^2+(log(os))^2))

sgrid(zeta,0);
disp('Zoom e tecle qualquer coisa')
pause;
[k,p] = rlocfind(G)

%% novo %os = 15%
os = 0.15;      
zeta = sqrt(((log(os))^2)/(pi^2+(log(os))^2))

numGlead = [1 5];
denGlead = [1 52.84];
Glead = tf(numGlead,denGlead);
rlocus(Glead*G);

sgrid(zeta,0);
disp('Zoom e tecle qualquer coisa')
pause;
[klead,plead]=rlocfind(Glead*G)

% por fim, vamos gerar uma resposta ? rampa
% rode o modelo simulink lista2ex6.slx

%% ---- EXERCICIO #7 

close all;
clear;
clc;

numG = 1;
denG = poly([-1 -3]);
G = tf(numG,denG);

numGc = poly([-0.1 -7.73]);
denGc = [1 0];
Gc = tf(numGc,denGc);

rlocus(Gc*G);
zeta = 0.707;
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[k,p]=rlocfind(G*Gc)

step(feedback(k*Gc*G,1))

%% ---- EXERCICIO #8 

close all;
clear;
clc;

numGp = 70;
denGp = [50 1];
Gp = tf(numGp,denGp);

numGv = 0.02;
denGv = [4 1];
Gv = tf(numGv,denGv);

numH = 1;
denH = [12 1];
H = tf(numH,denH);

rlocus(Gp*Gv*H);
zeta = 0.7;
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[k,p]=rlocfind(Gp*Gv*H)

step(feedback(k*Gp*Gv,H))

%% Pt. 2
numGc = [1 0.1919];
denGc = 1;
Gc = tf(numGc,denGc);
rlocus(Gc*Gp*Gv*H);
zeta = 0.7;
sgrid(zeta,0);
disp('zoom e clique algo')
pause;
[kc,pc]=rlocfind(Gc*Gp*Gv*H)

Tc = feedback(kc*Gc*Gp*Gv*H,1);
ltiview(Tc)
