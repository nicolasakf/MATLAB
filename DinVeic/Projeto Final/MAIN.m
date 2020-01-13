% Projeto Final - Dinamica Vertical Mini Baja
% Dinamica Veicular - Nicolas Fonteyne e Felipe Goichman
% MAIN.m

%% Comandos Iniciais

clear
close all
clc

%% Constantes do Veiculo
% Obs.: unidades em SI, quando nao comentadas.

M_total = 0;

% Distribuicao Estatica de Carga
dianteira = 0.3*M_total*9.81;
traseira = 0.1*M_total*9.81;

% Massa Nao Suspensa
%geral
M_amortecedor = 1.2;
M_ball_joints = .15;
M_cubo_de_roda = .15;
M_manga_de_eixo = .15;
M_roda_pneu = 8;
M_rolamento = .1;
%dianteira
M_braco_susp_f = .3;
%traseira
M_braco_susp_r = .5;

% Dimensoes
entre_eixos = 1.74;
bitola_f = 1.6;
bitola_r = 1.5;

%% 

Mu_f = 4*M_braco_susp_f + 2*M_amortecedor + 2*M_rolamento + 2*M_ball_joints + 2*M_cubo_de_roda + 2*M_manga_de_eixo + 2*M_roda_pneu;
Mu_r = 2*M_braco_susp_r + 2*M_amortecedor + 2*M_rolamento + 2*M_cubo_de_roda + 2*M_manga_de_eixo + 2*M_roda_pneu;
