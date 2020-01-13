% Valor de Referencia

clear
clc

I = 29/6;

%% Ex. 22.2

intVec = [1,2,4,8];

it = 0;
for i = intVec
    it = it+1;
    [I1(it),ea1(it)] = Romberg(1,2,i,0.5);
    et1(it) = abs((I-I1(it))/I*100);
end

%% Ex. 22.4

load('legendreMatrix.mat');

for i = [1,2,3]
    if i == 1
        I2(i) = int_gauss_legendre(matriz_cx2,1,2);
        et2(i) = abs((I-I2(i))/I*100);
    elseif i == 2
        I2(i) = int_gauss_legendre(matriz_cx3,1,2);
        et2(i) = abs((I-I2(i))/I*100);
    elseif i == 3
        I2(i) = int_gauss_legendre(matriz_cx4,1,2);
        et2(i) = abs((I-I2(i))/I*100);
    end
end

%% FINAL

table22_2 = table([I1(1);I1(2);I1(3);I1(4)],...
            [ea1(1);ea1(2);ea1(3);ea1(4)],...
            [et1(1);et1(2);et1(3);et1(4)],...
            'RowNames',{'1','2','4','8'},'VariableNames',{'I','ea','et'})
table22_4 = table([I2(1);I2(2);I2(3)],...
            [et2(1);et2(2);et2(3)],...
            'RowNames',{'2','3','4'},'VariableNames',{'I','et'})


