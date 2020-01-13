%% Aula 17

%% Exerc?cio (1) - ess p/ entrada degrau
numg=500*poly([-2 -5 -6]);
deng=poly([0 -8 -10 -12]);
G=tf(numg,deng);
'O sistema ? est?vel em malha fechada?'
T=feedback(G,1);
polos=pole(T)
'Erro para entrada degrau?'
Kp=dcgain(G)  % avalia constante de erro Kp=numg/deng para s=0
ess=1/(1+Kp)  % avalia o erro em regime para entrada degrau
'Vamos plotar a resposta ao degrau...'
figure();
step(T);      % d? a impress?o de ter ess \dif zero (!)
figure();
step(T,2);    % ...mas plotando para 2 segundos, vemos que ess=0
              % ...ou seja, Tr r?pido mas Ts lento!
%% Exerc?cio (1) - erro em regime p/ entrada rampa
'Qual ? o erro em regime para entrada rampa?'
numsg=conv([1 0],numg);  % definindo o numerador de sG(s)
densg=poly([0 -8 -10 -12]);
sG=tf(numsg,densg);
sG=minreal(sG);  % cancela o 's' do numerador com denominador
Kv=dcgain(sG)    % avalia Kv=sG(s) para s=0
ess=1/Kv         % avalia o erro em regime para entrada rampa
'Vamos plotar a resposta ? rampa...'
t = 0:0.01:2;
u=t;
%u = 2*t;
[y,t,x] = lsim(T,u,t);
figure();
plot(t,y,'r',t,u,'b')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-azul, Sa?da-vermelho')
grid on;
    
%% Exerc?cio (1) - erro em regime p/ entrada parab?lica
'Qual ? o erro em regime para entrada parab?lica?'
nums2g=conv([1 0 0],numg);  % definindo o numerador de s^2G(s)
dens2g=poly([0 -8 -10 -12]);
s2G=tf(nums2g,dens2g);
s2G=minreal(s2G);     % cancela o 's^2' do numerador com denominador
Ka=dcgain(s2G)    % avalia Ka=s^2G(s) para s=0
ess=1/Ka      % avalia o erro em regime para entrada parab?lica

t = 0:0.01:10;
u = (1/2)*t.^2;
[y,t,x] = lsim(T,u,t);
figure();
plot(t,y,'r',t,u,'b')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-azul, Sa?da-vermelho')
erro=u(:)-y;
figure();
plot(t,erro);
xlabel('Tempo (seg)')
ylabel('Erro')
title('Erro em regime - entrada parab?lica')
grid on;
pause;

%% Exerc?cio 3 - encontre K para que ess=10%
'Exerc?cio 3 - encontre K para que ess=10%'
close all
clear all

numgdK=[1 5];               % Define o numerador de G(s)/K
dengdK=poly([0 -6 -7 -8]);  % Define o denominador de G(s)/K
GdK=tf(numgdK,dengdK);      % Cria a TF G(s)/K
numgkv=conv([1 0],numgdK);  % define o numerador de sG(s)/K
dengkv=dengdK;              % define o denominador de sG(s)/K
GKv=tf(numgkv,dengkv);      % Cria sG(s)/K
GKv=minreal(GKv);           % Cancela o 's' do numerador e denominador

KvdK=dcgain(GKv);           % Calcula a constante de erro Kv

ess=0.1;                    % Erro em regime dado no enunciado
%K=1/(ess*KvdK)              % Encontra o valor do ganho K que cumpre com
K=1200                      % especifica??o de ess=10% p/ entrada rampa! 

'Vamos verificar a estabilidade em malha fechada para o ganho encontrado'
T=feedback(K*GdK,1);
polos=pole(T)
%pause;

% Vamos plotar a resposta ? rampa para verificar o resultado de ess
t = 0:0.01:5;
u = t;
[y,t,x] = lsim(T,u,t);
figure();
plot(t,y,'r',t,u,'b')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-azul, Sa?da-vermelho')
grid on;
   
%% Exerc?cio 4
numG=poly([-3 -5]);
denG=poly([0 -7 -8]);
G=tf(numG,denG);
%K=1;
K=37.33
T = feedback(K*G,1);
'O sistema ? est?vel em malha fechada?'
polos=pole(T)
t = 0:0.1:25;
u = t;
step(T)
grid on
[y,t,x] = lsim(T,u,t);
figure();
plot(t,y,'b',t,u,'r')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-vermelho, Saida-azul')
grid on;

%pause;

%% Vamos inserir um integrador no ramo direto para tornar o sistema Tipo 2
K=1;
Ki=1;
%Ki=10;
C=tf(1,[1 0]);
T=feedback(C*Ki*G+K*G,1);

t = 0:0.1:250;
u = t;
%step(T)
grid on
[y,t,x] = lsim(T,u,t);
figure();
plot(t,y,'b',t,u,'r')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-vermelho, Saida-azul')
grid on;

figure();
plot(t,y,'b',t,u,'r')
xlabel('Tempo (seg)')
ylabel('Amplitude')
title('Entrada-vermelho, Saida-azul')
grid on;
axis([239.9,240.1,239.9,240.1])
%axis([29.9,30.1,29.9,30.1])