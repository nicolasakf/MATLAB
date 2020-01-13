% PROVA FINAL
% Nicolas Fonteyne - 30/11/17

clear
clc

%% Dados do Problema

xVector = [0,1,2,3,4];
yVector = [0,1,2,3,4];
tMatrix = [250,200,150,100,50;
           225,180.5,135.8,90.35,45.55;
           200,160.25,127.4,85.75,34.65;
           175,137.2,118.6,62.75,28.95;
           150,125,100,50,20];
%item a)
xa = 2;
ya = 2.3;
%item b)
xb = 3.2;
yb = 0.7;

%% item a)

x = xVector(3);
tValues = tMatrix(:,3);

ta1 = newton_interpolation(yVector,tValues,ya); % metodo de newton

ta2 = lagrange_linear(yVector,tValues,ya); % metodo de lagrange

%% item b)

[r,c] = size(tMatrix);

tInt = [];

for i = 1:r
    tValues = tMatrix(i,:);
    tInt(1,i) = newton_interpolation(xVector,tValues,xb); 
end

tb1 = newton_interpolation(yVector,tInt,yb); % metodo de newton

for i = 1:r
    tValues = tMatrix(i,:);
    tInt(1,i) = lagrange_linear(xVector,tValues,xb);
end

tb2 = lagrange_linear(yVector,tInt,yb); % metodo de lagrange
 
%% FINAL

tableAns = table([ta1;tb1],[ta2;tb2],...
                'RowNames',{'item a)','item b)'},...
                'VariableNames',{'Newton','Lagrange'})
