clear
clc

% PARAMTEROS DO CARRO

mt = 3000; % massa total
C = 1.5; % distancia do eixo traseiro ao CG
B = 1; % distancia do eixo dianteiro ao CG
L = 2.714; % distancia entre eixos
wtf = 6000; % peso total (sprung + unsprung) na dianteira
wtr = 8000; % peso total (sprung + unsprung) na traseira
wt = wtf + wtr; % peso total
wst = 3000; % peso sprung total
CalphaFLinha = 940.49; % cornering stiffness dianteira
CalphaRLinha = 692.26; % cornering stiffness traseira
KsF = 1000; % rigidez elastica da mola da susp. dianteira
KsR = 1000; % rigidez elastica da mola da susp. traseira
KtF = 10000; % rigidez elastica da mola do pneu dianteira
KtR = 10000; % rigidez elastica da mola do pneu traseira
tF = 2; % bitola do veiculo dianteira
tR = 3; % bitola do veiculo traseira
rrF = (KsF*KtF)/(KsF+KtF); % ride rate (K resultante da associacao de molas em serie da susp. com o pneu) dianteira
rrR = (KsR*KtR)/(KsR+KtR); % ride rate (K resultante da associacao de molas em serie da susp. com o pneu) traseira
hRCF = 1; % altura do roll center da dianteira
hRCR = 0.8; % altura do roll center da traseira
suspF_indep = true; % se a susp. dianteira for independente => true
suspR_indep = false; % se a susp. traseira for independente => true
h1 = 90; % distancia vertical do CG ao roll axis

% DADOS DO PROBLEMA
R = 100; % raio da curva
v = 100/3.6; % velocidade do carro
ay = v^2/R; % aceleracao lateral

% PARAMETROS GERAIS
g = 9.81; % aceleracao grav.
FyF = (mt*v^2)/(R*(1+B/C)); % forca lateral aplicada pelas rodas do eixo dianteiro
FyR = (mt*v^2)/(R*(1+C/B)); % forca lateral aplicada pelas rodas do eixo traseiro
b = 0.00001; % coeficiente multiplicar do termo quadratico da curva CalphaLinha do pneu

%calculo do Rfi
if suspF_indep == false
    sF = 2; % distancia entre molas da dianteira
    KfiF = 0.5*KsF*sF^2; % rigidez ao rolamento da suspensao dianteira
end
if suspF_indep
    KfiF = 0.5*rrF*tF^2; 
end
if suspR_indep == false
    sR = 3; % distancia entre molas da traseira
    KfiR = 0.5*KsR*sR^2; % rigidez ao rolamento da suspensao traseira
end
if suspR_indep
    KfiR = 0.5*rrR*tR^2;
end

Rfi = (wst*h1)/(KfiF+KfiR-wst*h1); % razao de rolamento do veiculo ( = dfi/day)

%% k_tire

k_tire = (wtf/2)/CalphaFLinha-(wtr/2)/CalphaRLinha

% Obs.: se Calpha[F/R] for para o eixo, usar wtf ao inves de wtf/2 e Calpha
% ao inves de CalphaRLinha

%% k_lateral_load_transfer (k_llt)

fi = ((wst*h1*v^2)/(R*g))/(KfiF+KfiR-wst*h1);

deltaFzF = ((2*FyF*hRCF)/tF+(2*KfiF*fi)/tF)/2; % diferen?a entre o peso (em cada roda) em condicao estatica e dinamica para o eixo dianteiro
deltaFzR = ((2*FyR*hRCR)/tF+(2*KfiR*fi)/tR)/2; % diferen?a entre o peso (em cada roda) em condicao estatica e dinamica para o eixo traseiro

k_llt = (wtf*2*b*deltaFzF^2)/CalphaFLinha^2-(wtr*2*b*deltaFzR^2)/CalphaRLinha

%% k_camber

dgamaF_dfi = 90; % variacao do camber pela rolagem dianteira
dgamaR_dfi = 90; % variacao do camber pela rolagem traseira
cfiF = 4; % camber stiffness dianteira
cfiR = 4; % camber stiffness traseira

k_camber = ((cfiF/CalphaFLinha)*dgamaF_dfi - (cfiR/CalphaRLinha)*dgamaR_dfi)*Rfi

%% k_roll_steer

eF = 10; % coeficiente de roll steer no eixo dianteiro (preferencialmente, este deve ser 0)
eR = 10; % coeficiente de roll steer no eixo traseiro ( = beta do roll axis para eixos rigidos)

k_roll_steer = (eF-eR)*Rfi

%% k_lateral_force_compliance_steer (k_lfcs)

delcF = 90; % angulo de estercamento gerado na dianteira
delcR = 90; % angulo de estercamento gerado na traseira

Af = delcF/FyF; % coeficiente de estercamento gerado pela forca lateral aplicada no eixo dianteiro
Ar = delcR/FyR; % coeficiente de estercamento gerado pela forca lateral aplicada no eixo traseiro

k_lfcs = Af*wtf-Ar*wtr

%% k_aligning_torque (k_at)

p = 13;

k_at = wt*(p/L)*(CalphaFLinha+CalphaRLinha)/(CalphaFLinha*CalphaRLinha)

%% RESULTADOS

fprintf('----------------------- RESULTADOS -----------------------');

k_total = sum([k_tire,k_llt,k_camber,k_roll_steer,k_lfcs,k_at])

del = L/R*57.3 + k_total*ay

GVGuinada = (v/L)/(1+(k_total*v^2)/(57.3*L*g))
GALateral = (v^2/(57.3*L*g))/(1+((k_total*v^2)/(57.3*L*g)))