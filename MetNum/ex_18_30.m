% Ex 18.30

clear
clc

xVector = [0,2,4,6,8];
yVector = [0,2,4,6,8];
tVector = [100,90,80,70,60;
    85,64.49,53.5,48.15,50;
    70,48.9,38.43,35.03,40;
    55,38.78,30.39,27.07,30;
    40,35,30,25,20];

xa = 4;
ya = 3.2;
xb = 4.3;
yb = 2.7;

n = 3;

%% item a)

x = xVector(3);
tValues = tVector(:,3);

ta1 = newton_interpolation(yVector,tValues,ya); % metodo de newton

ta2 = lagrange_linear(yVector,tValues,ya); % metodo de lagrange

%% item b)

[r,c] = size(tVector);

tInt = [];

for i = 1:r
    tValues = tVector(i,:);
    tInt(1,i) = newton_interpolation(xVector,tValues,xb); 
end

tb1 = newton_interpolation(yVector,tInt,yb); % metodo de newton

for i = 1:r
    tValues = tVector(i,:);
    tInt(1,i) = lagrange_linear(xVector,tValues,xb);
end

tb2 = lagrange_linear(yVector,tInt,yb); % metodo de lagrange
 
%% FINAL

tableAns = table([ta1;tb1],[ta2;tb2],...
                'RowNames',{'item a)','item b)'},...
                'VariableNames',{'Newton','Lagrange'})
