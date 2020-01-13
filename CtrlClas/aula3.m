%% Aula #3 - Fundamentos do LGR

%% Exercicio #1;
num = 10;
den = [1 10 0];
CG = tf(num,den);
% pzmap(CG); hold on;

%% ganho k = 0.1
k = 0.1;                        % ganho k = 0.1
T = feedback(k*CG,1);
[zT,pT,kT] = zpkdata(T,'v')     % polos em malha fechada para k = .1

%%  ganho k = 1
k = 1;                           % ganho k = 1
T = feedback(k*CG,1);
[zT,pT,kT] = zpkdata(T,'v')     % polos em malha fechada para k = 1

%%  ganho k = 1.5
k = 1.5;                           % ganho k = 1.5
T = feedback(k*CG,1);
[zT,pT,kT] = zpkdata(T,'v')     % polos em malha fechada para k = 1.5



%% ganho k=1.5 e polo em
clear all;
clc;
k = 0.1;
s = -0.10;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)

%% ganho k=0.1 e polo em -9.89
clear all;
clc;
disp('ganho k=0.1 e polo em -9.89');
k = 0.1;
s = -0.10;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)

%% ganho k=1 e polo em -1.12
clear all;
clc;
k = 1;
s = -1.12;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)

%% ganho k=1 e polo em -8.87
clear all;
clc;
k = 1;
s = -8.87;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)

%% ganho k=5 e polo em -5+j5
clear all;
clc;
k = 5;
s = -5+5j;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)


%% ganho k=5 e polo em -5-j5
clear all;
clc;
k = 5;
s = -5-5j;
kGH = (10*k)/(s*(s+10))
abs(kGH)
angle(kGH)


%% vamos pegar um outro ponto qualquer, tipo polo em -2-2j
clear all;
clc;
s = -2-2j;                  % queremos saber se esse s esta no LGR ... 
GH = (10)/(s*(s+10))
k = 1/abs(GH);              % ajustamos o ganho para que abs(kGH) = 1 ...
kGH = (10*k)/(s*(s+10));
abs(kGH)                    % ... e obvio, modulo(kGH) = 1 ... 
angle(kGH)                  % ... mas e a fase?
