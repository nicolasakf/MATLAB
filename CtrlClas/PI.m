% PROVA INTERMEDIARIA

close all;
clear;
clc;

%% Ex 5

disp('Sistema n?o compensado');

% Parametros iniciais
os = 10;
zeta = find_zeta(os);
%zeta = 0.707;

numG = 1;
denG = poly([-2+2i,-2-2i,-10]);

G = tf(numG,denG);

rlocus(G);
sgrid(zeta,0);  

disp('zoom e clique algo')
pause;

[k,p] = rlocfind(G)
kp = dcgain(k*G)


%outputs
ess = 1/(1+kp);
ts = -4/real(p(2)); % verificar se p(n) corresponde ao par de polos dominantes
tp = abs(pi/imag(p(2))); % verificar se p(n) corresponde ao par de polos dominantes
ansTable = array2table([ess,ts,tp],'VariableNames',{'ess','ts','tp'},'RowNames',{'ans'})

%resposta ao degrau
T = feedback(k*G,1);
%step(T);


%% EX 6

disp('Sistema compensado - PI DUPLO');

numGc_av = [1 0.1];
denGc_av = [1 0];

Gc_pi = tf(numGc_av,denGc_av);

rlocus(Gc_pi*G);
sgrid(zeta,0);

disp('zoom e clique algo')
pause;

%outputs
[kc_pi,pc_pi] = rlocfind(Gc_pi*G)
kp_pi = dcgain(kc_pi*Gc_pi*G)
ess_pi = 1/(1+kp_pi)
ts_pi = -4/real(pc_pi(2)) % verificar se p(n) corresponde ao par de polos dominantes

%resposta ao degrau
T_pi = feedback(kc_pi*Gc_pi*G,1);
%step(T_pi);


%% FINAL


