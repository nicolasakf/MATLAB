%% Aula PI e PID - visão analítica
% by Vinicius Licks

% Exercício #2
m=5;
b=1;

Kp=19;
Ki=69.3;
Kd=0;

s=tf('s');
G=1/(m*s+b);      % criando a FT da planta

C=Kp + Ki/s + Kd*s;    % criando a FT do controlador
% C = pid(Kp,Ki,Kd)    % maneira alternativa de criar a FT do controlador

T=feedback(C*G,1);     % FT malha fechada

figure(1); hold on;
figure(2); hold on;

% Agora, vamos aumentar Kp (mantendo Ki fixo) e entender o que acontece com
% a resposta ao degrau e com a posição dos polos.

Kp=19;Ki=69.3;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=25;Ki=69.3;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=32;Ki=69.3;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=34;Ki=69.3;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);

pause;

% Agora, vamos aumentar Ki (mantendo Kp fixo) e entender o que acontece com
% a resposta ao degrau e com a posição dos polos.

close(1); close(2); 
figure(1); hold on;
figure(2); hold on;

Kp=34;Ki=62;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=34;Ki=80;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=34;Ki=100;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);
Kp=34;Ki=120;Kd=0;C=Kp + Ki/s + Kd*s;T=feedback(C*G,1);figure(1);step(T);figure(2);pzmap(T);

