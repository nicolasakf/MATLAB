% Nicolas Fonteyne - Desafio 1
% Analise do veiculo descarregado

clc
clear

% parametros do problema e constantes
g = 9.81;
l = 2.714;
v1 = 100/3.6;
v2 = 60/3.6;
R1 = 100;
R2 = 40;

anguloCamber = 0.5/57.3;

% paramteros - carro descarregado
% massas
msf = 694;
msr = 452;
muf = 106;
mur = 86;
mtotal = msf + msr + muf + mur;

% pesos
wsf = msf*g;
wsr = msr*g;
wuf = muf*g;
wur = mur*g;
wF = (msf+muf)*g;
wR = (msr+mur)*g;
wtotal = mtotal*g;

%Ktire -------------------------------------------------------------------

% ajuste da curva cAplha(peso)
pesos = [931.95,2060.1,3090.15,4130.01,5101.2,6278.4];
cAlphas = [350,520,780,1100,1200,1400];
coef = polyfit(pesos,cAlphas,2);
syms peso
cAlpha_peso = symfun(coef(1)*peso^2 + coef(2)*peso + coef(3),peso);

c_alphaF_linha = double(cAlpha_peso(wF/2)); % cornering stiffness dos pneus diareiros
c_alphaR_linha = double(cAlpha_peso(wR/2)); % cornering stiffness dos pneus traseiros

Kt = (wF/2)/c_alphaF_linha - (wR/2)/c_alphaR_linha;

%Kllt --------------------------------------------------------------------


lCG_f = (wR*l)/(wF+wR);
hCG = 0.5992; % altura do CG ao chao
hf = 0.15; % altura do roll center dianteiro
hr = 0.165; % altura do roll center traseiro
h1 = hCG - ((hr-hf)/l)*lCG_f; % distancia vertical do roll axis ao CG

kt = 200/(10^-3); % rigidez elastica do pneu
tF = 1.524; % bitola dianteira
tR = 1.53; % bitola traseira

DeflexaoF = 115.8E-3; % deflexao (cond. estatica) das duas molas dianteiras
kwF = (wsf/2)/DeflexaoF; % k molas dianteiras

DeflexaoR = 147.7E-3; % deflexao (cond. estatica) das duas molas traseiras
kwR = (wsr/2)/DeflexaoR; % k molas traseiras

rrF = (kwF*kt)/(kwF+kt); % rigidez resultante da associacao em serie de molas (pneu + susp) da dianteira
rrR = (kwR*kt)/(kwR+kt); % rigidez resultante da associacao em serie de molas (pneu + susp) da traseira

kfiF = 0.5*rrF*tF^2; % rigidez ao rolamento da suspensao dianteira
kfiR = 0.5*rrR*tR^2; % rigidez ao rolamento da suspensao traseira

FzF1 = (kfiF*((wtotal*h1*v1^2/(R1*g))/(kfiF+kfiR-wtotal*h1)) + wF*hf*v1^2/(R1*g))/tF; % forca suportada pelo eixo dianteiro na condicao 1
FzR1 = (kfiR*((wtotal*h1*v1^2/(R1*g))/(kfiF+kfiR-wtotal*h1)) + wR*hr*v1^2/(R1*g))/tR; % forca suportada pelo eixo traseiro na condicao 1

FzF2 = (kfiF*((wtotal*h1*v2^2/(R2*g))/(kfiF+kfiR-wtotal*h1)) + wF*hf*v2^2/(R2*g))/tF; % forca suportada pelo eixo dianteiro na condicao 2
FzR2 = (kfiR*((wtotal*h1*v2^2/(R2*g))/(kfiF+kfiR-wtotal*h1)) + wR*hr*v2^2/(R2*g))/tR; % forca suportada pelo eixo traseiro na condicao 1

b = coef(1)*-1; % coeficiente que multiplica o termo de segundo grau na aprox da curva do pneu

Kllt1 = (wF/c_alphaF_linha)*((2*b*FzF1^2)/(c_alphaF_linha*2)) - (wR/c_alphaR_linha)*((2*b*FzR1^2)/(c_alphaR_linha*2));
Kllt2 = (wF/c_alphaF_linha)*((2*b*FzF2^2)/(c_alphaF_linha*2)) - (wR/c_alphaR_linha)*((2*b*FzR2^2)/(c_alphaR_linha*2));

%Kcamber -----------------------------------------------------------------

cgama_calphaF = 0.1; % razao da rigidez de cambagem pela rigidez de curvatura dos pneus dianteiros
cgama_calphaR = 0.1; % razao da rigidez de cambagem pela rigidez de curvatura dos pneus traseiros

fi1 = ((wtotal*h1*v1^2)/(R1*g))/(kfiF+kfiR-wtotal*h1); % angulo de rolamento do carro na cond. 1
fi2 = ((wtotal*h1*v2^2)/(R2*g))/(kfiF+kfiR-wtotal*h1); % angulo de rolamento do carro na cond. 2

Rfi1 = (wtotal*h1*v1^2)/(kfiF+kfiR-wtotal*h1); % rigidez ao rolamento do veiculo
Rfi2 = (wtotal*h1*v2^2)/(kfiF+kfiR-wtotal*h1); % rigidez ao rolamento do veiculo

deltaZF1 = fi1*(tF/2);
deltaZR1 = fi1*(tR/2);
deltaZF2 = fi2*(tF/2);
deltaZR2 = fi2*(tR/2);

syms dz
gama_dz = symfun(118.94*dz^2 - 15.218*dz + 0.4986,dz);

dgama_dfiF1 = double(gama_dz(deltaZF1)/fi1);
dgama_dfiR1 = double(gama_dz(deltaZR1)/fi1);
dgama_dfiF2 = double(gama_dz(deltaZF2)/fi2);
dgama_dfiR2 = double(gama_dz(deltaZR2)/fi2);

Kcamber1 = Rfi1*(cgama_calphaF*dgama_dfiF1 - cgama_calphaR*dgama_dfiR1);
Kcamber2 = Rfi2*(cgama_calphaF*dgama_dfiF2 - cgama_calphaR*dgama_dfiR2);

%Kfinal -----------------------------------------------------------------

Kvector1 = [Kt;Kllt1;Kcamber1];
Kvector2 = [Kt;Kllt2;Kcamber2];
K1 = sum(Kvector1);
K2 = sum(Kvector2);
condicao1 = [Kt;Kllt1;Kcamber1;K1];
condicao2 = [Kt;Kllt2;Kcamber2;K2];

table(condicao1,condicao2,'RowNames',{'Ktire';'Kllt';'Kcamber';'K'}) % resultado final
