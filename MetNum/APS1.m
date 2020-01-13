% APS1 - Nicolas Fonteyne

clear
clc

%% Ex 5.19

r = 1; % raio da esfera
ps = 200; % densidade da esfera
pw = 1000; % densidade da agua

vTotal = (4*pi*r^3)/3;
pesoEsfera = ps*vTotal*9.81; % tem que ser igual a pesoFluido

% pesoFluido = (vTotal - V)*pw*9.81, portanto:
% pw*pi/3*h^3 - pw*r*pi*h^2 + pw*4*pi*r^3/3 - pesoEsfera = 0

a = pw*pi/3;
b = -pw*r*pi;
c = pw*4*pi*r^3/3 - pesoEsfera;

[x1,erro1,it1] = bissecao([a,b,0,c],3,4,0.01); % bissecao

[x2,erro2,it2] = falsa_pos([a,b,0,c],3,4,0.01); % falsa posicao

[x3,erro3,it3] = falsa_pos([a,b,0,c],3.1,3.3,0.01); % falsa posicao modificado

tabelaResposta = table([x1;x2;x3],[erro1;erro2;erro3],[it1;it2;it3],'RowNames',{'bissecao','falsa_pos','false_pos_mod'},'VariableNames',{'h','erro','iteracoes'})

%{

COMENT?RIOS

Como podemos averiguar pela tabela resposta da quest?o, para atingir um
valor de erro < 0.01%, o metodo da bisse?ao ? o que mais "sofre". Isso ?
consequ?ncia do seu algoritimo, que faz consecutivas m?dias aritm?ticas dos
valores xl e xu fornecidos, e, portanto, oscila mais do que o m?todo da
falsa posi??o em torno do ponto, que por sua vez, se utiliza de uma
aproxima??o linear entre os pontos fornceidos. Dada a natureza da curva,
essa aproxima??o ? excelente, e, portanto, pouca diferen?a faz usarmos esse
m?todo ou sua vers?o modificada.

%}

%% Ex 6.17

syms x
fx = @(x) 0.0074*x^4 -0.284*x^3 +3.355*x^2 -12.183*x +5;

[x1,erro1,it1] = newton_raphson(symfun(0.0074*x^4 -0.284*x^3 +3.355*x^2 -12.183*x +5,x),17.15,0.01);

[x2,erro2,it2] = secante(fx,15,20,0.01);

[x3,erro3,it3] = brent(fx,15,20,0.01);

tabelaResposta = table([x1;x2;x3],[erro1;erro2;erro3],[it1;it2;it3],'RowNames',{'newton_raphson','secante','brent'},'VariableNames',{'h','erro','iteracoes'})

%{

COMENT?RIOS

Uma vez que a forma da curva analisada ? pr?xima de uma reta no ponto
desejado, ambas as aproxima??es de newton raphson e a secante apresentam
resultados muito parecidos e para o mesmo numero de itera??es. J? brent,
por fazer uso de uma interpola?ao quadratica, e, ao mesmo tempo, combinar o
metodo da bissecao e secante, ? capaz de convergir mais rapidamente para o
mesmo n?vel de confiabilidade.

%}
