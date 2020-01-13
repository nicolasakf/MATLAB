% Dinamica Veicular - APS 4
% Nicolas Fonteyne (11/11/2017)

clear
clc

%% Dados do Problema => Todas as unidades estao em SI quando nao comentadas

kf = 18; %KN/m
kr = 25.5; %KN/m
kt = 200000;
Cf = 1420;
Cr =  2000;
Mtotal_carregado = 1980;
Mtotal_descarregado = 1380;
M_naoSuspensa = 210;
M_Suspensa_carregado = Mtotal_carregado - M_naoSuspensa;
M_Suspensa_descarregado = Mtotal_descarregado - M_naoSuspensa;
Entre_eixos = 2.3;
Raio_de_Giracao =  1.256;

RRf = kf*kt/(kf+kt)*1000;
RRr = kr*kt/(kr+kt)*1000;

Msf_carregado = M_Suspensa_carregado*.33;
Msr_carregado = M_Suspensa_carregado*.67;

Msf_descarregado = M_Suspensa_descarregado*.42;
Msr_descarregado = M_Suspensa_descarregado*.58;

Muf = Mtotal_descarregado*.42/2 - Msf_descarregado*.42/2
Mur = Mtotal_descarregado*.58/2 - Msf_descarregado*.58/2

%% Ex. 1

% Para massa suspensa carregada
Wnf_carregado = sqrt(RRf/(Msf_carregado/2));
Wnr_carregado = sqrt(RRr/(Msr_carregado/2));

Wdf_carregado = Wnf_carregado*sqrt(1-(Cf/(2*sqrt(kf*Msf_carregado/2))^2));
Wdr_carregado = Wnr_carregado*sqrt(1-(Cr/(2*sqrt(kr*Msr_carregado/2))^2));

% Para massa suspensa descarregada
Wnf_descarregado = sqrt(RRf/(Msf_descarregado/2));
Wnr_descarregado = sqrt(RRr/(Msr_descarregado/2));

Wdf_descarregado = Wnf_descarregado*sqrt(1-(Cf/(2*sqrt(kf*Msf_descarregado/2))^2));
Wdr_descarregado = Wnr_descarregado*sqrt(1-(Cr/(2*sqrt(kr*Msr_descarregado/2))^2));

% Para massa nao suspensa
Wn2_f = sqrt((kt+kf)/(M_naoSuspensa/4))
Wn2_r = sqrt((kt+kr)/(M_naoSuspensa/4))

% tabela resposta
tableAnsEx1 = table([Wnf_descarregado;Wnr_descarregado;Wdf_descarregado; Wdr_descarregado],...
                    [Wnf_carregado;Wnr_carregado;Wdf_carregado; Wdr_carregado],...
                    'RowNames',{'Wnf','Wnr','Wdf','Wdr'},...
                    'VariableNames',{'Descarregado','Carregado'})

%% Ex. 2

% Carregado
zf_carregado = Msf_carregado*9.81/2/kf/1000;
zr_carregado = Msr_carregado*9.81/2/kr/1000;

% Descarregado
zf_descarregado = Msf_descarregado*9.81/2/kf/1000;
zr_descarregado = Msr_descarregado*9.81/2/kr/1000;

% tabela resposta
tableAnsEx2 = table([zf_descarregado;zr_descarregado],...
                    [zf_carregado;zr_carregado],...
                    'RowNames',{'zf','zr'},...
                    'VariableNames',{'Descarregado','Carregado'})

%% Ex. 3

%Carregado
alpha_carregado = (RRf+RRr)/Mtotal_carregado ;
c = Entre_eixos*0.58;
b = Entre_eixos*0.42;
B_carregado = (kr*c-kf*b)/Mtotal_carregado;
y_carregado = (kf*b^2+kr*c^2)/(Mtotal_carregado*Raio_de_Giracao^2);

w1_carregado = sqrt((alpha_carregado+y_carregado)/2+sqrt(((alpha_carregado-y_carregado)^2)/4+((B_carregado^2)/Raio_de_Giracao^2)));
w2_carregado = sqrt((alpha_carregado+y_carregado)/2-sqrt(((alpha_carregado-y_carregado)^2)/4+((B_carregado^2)/Raio_de_Giracao^2)));

zetateta1_carregado = -B_carregado/(alpha_carregado-w1_carregado^2);
zetateta2_carregado = -B_carregado/(alpha_carregado-w2_carregado^2);

if abs(zetateta1_carregado) > Entre_eixos/2
    bounce_carregado = zetateta1_carregado;
    pitch_carregado = zetateta2_carregado;
else
    bounce_carregado = zetateta2_carregado;
    pitch_carregado = zetateta1_carregado;
end

%Descarregado
alpha_descarregado = (kf+kr)/Mtotal_descarregado ;
c = Entre_eixos*0.67;
b = Entre_eixos*0.33;
B_descarregado = (kr*c-kf*b)/Mtotal_descarregado;
y_descarregado = (kf*b^2+kr*c^2)/(Mtotal_descarregado*Raio_de_Giracao^2);

w1_descarregado = sqrt((alpha_descarregado+y_descarregado)/2+sqrt(((alpha_descarregado-y_descarregado)^2)/4+((B_descarregado^2)/Raio_de_Giracao^2)));
w2_descarregado = sqrt((alpha_descarregado+y_descarregado)/2-sqrt(((alpha_descarregado-y_descarregado)^2)/4+((B_descarregado^2)/Raio_de_Giracao^2)));

zetateta1_descarregado = -B_descarregado/(alpha_descarregado-w1_descarregado^2);
zetateta2_descarregado = -B_descarregado/(alpha_descarregado-w2_descarregado^2);

if abs(zetateta1_descarregado) > Entre_eixos/2
    bounce_descarregado = zetateta1_descarregado;
    pitch_descarregado = zetateta2_descarregado;
else
    bounce_descarregado = zetateta2_descarregado;
    pitch_descarregado = zetateta1_descarregado;
end

% tabela resposta

tableAnsEx3 = table([bounce_descarregado;pitch_descarregado],...
                    [bounce_carregado;pitch_carregado],...
                    'RowNames',{'bounce','pitch'},...
                    'VariableNames',{'Descarregado','Carregado'})

%% Ex. 4

% Carregado
a = (Msf_carregado/2)*M_naoSuspensa/4;
b = ((Msf_carregado/2)+M_naoSuspensa/4)*Cf;
c = ((Msf_carregado/2)*(kt+kf)+kf*M_naoSuspensa/4);
d = kt*Cf;
e = kt*kf;
H = tf([kt*Cf kt*kf],[a b c d e]);
figure(1)
bode(H)

% Descarregado
a = (Msf_descarregado/2)*M_naoSuspensa/4;
b = (Msf_descarregado/2)+(M_naoSuspensa/4)*Cf;
c = ((Msf_descarregado/2)*(kt+kf)+kf*M_naoSuspensa/4);
d = kt*Cf;
e = kt*kf;
G = tf([kt*Cf kt*kf],[a b c d e]);
figure(2)
bode(G)


