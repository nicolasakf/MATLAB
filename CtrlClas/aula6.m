%% EXERCICIO #1 da Aula #6 - (Exemplo 8.7 p.333 do Nise)
clear all;
clf;                                % apaga a figura ativa
numGH = [1 -4 20];                  % define o numerador de G(s)H(s)
denGH = poly([-2 -4]);              % polinomio cujas raízes sao -2 e -4 
GH = tf(numGH,denGH);               % cria a funcao de transferencia GH
rlocus(GH);                         % plota o LGR
zeta = 0.2:0.05:0.5;                % define vetor de 'zetas' de 0.2 a 0.5
wn = 0:1:10;                        % define vetor de 'freq. naturais' de 0 a 10 rad/s
sgrid(zeta,wn);                        % define um grid no LGR, tracando os zetas e wn's de interesse
title('Lugar Geométrico das Raízes')

pause;

rlocus(GH);
axis([-3 1 -4 4]);
title('Vista ampliada')
zeta= 0.45;                            % aqui define só a reta relacionada ao zeta = 0.45
wn = 0;                                % aqui vai suprimir do grafico as linhas relacionadas a freq. natural      
sgrid(zeta,wn);
for k = 1:3                            % laço que se repete 3 vezes permite selecionar 3 pontos no LGR
    [K,p] = rlocfind(GH)               % obtem o ganho K e os polos em malha fechada para o ponto selecionado
end

%% EXERCICIO #2 da Aula #6 - (Exercicio 8.5 p.334 do Nise)
clear all;
close all;
numG = poly([2 4]);              
denG = [1 6 25];                    
G = tf(numG,denG);               
rlocus(G);                        
axis([-5 5 -5 5]);
title('Vista ampliada')
zeta= 0.5;                            
wn = 0;                                     
sgrid(zeta,wn);
for k = 1:3                           
    [K,p] = rlocfind(G)               
end

%% EXERCICIO #3 - (Nise, Exemplo 8.8, pg 335)
clear all;
close all
numG = [1 1.5];
denG = poly([0 -1 -10]);
G = tf(numG,denG);
rlocus(G);

title('Lugar Geometrico das Raizes');

pause;

K = 0:0.005:50;

rlocus(G,K);

title('Lugar Geometrico das Raizes');

pup = input('Digite %OS ');

z = -log(pup/100)/sqrt(pi^2+(log(pup/100))^2)

sgrid(z,0)

title(['LGR com reta de OS de', num2str(pup),'%']);

[K,p] = rlocfind(G)

pause;

T = feedback(K*G,1);

step(T)

title(['Resposta ao degrau para K = ', num2str(K)])

