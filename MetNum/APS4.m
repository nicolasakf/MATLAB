% APS4 - Ex 17.28

clear
clc
close all

vVector = 10:10:80;
fVector = [25,70,380,550,610,1220,830,1450];

%% item a)

[err,p] = minimos_quadrados_lin(vVector,fVector,'no');

it = 1;
for i = vVector;
    fValues(1,it) = p(1)*i + p(2);
    it = it+1;
end

plot(vVector,fVector,'o',vVector,fValues);
legend('data','fited curve');
title('item a)');

%% item b)

for i = 1:length(vVector), log_vVector(1,i) = log10(vVector(i)); end
for i = 1:length(fVector), log_fVector(1,i) = log10(fVector(i)); end

[err,p] = minimos_quadrados_lin(log_vVector,log_fVector,'no');

a2 = 10^(p(2));
b2 = p(1);

it = 1;
for i = vVector;
    fValues(1,it) = a2*i^b2;
    it = it+1;
end

figure();
plot(vVector,fVector,'o',vVector,fValues);
legend('data','fited curve');
title('item b)');

%% item c)

% modelo a0(1-exp(-a1*x))+e

vVector = vVector';
fVector = fVector';

F = minimos_quadrados_nlin(vVector,fVector);

figure();
plot(F,vVector,fVector,'o');
title('item c)');
