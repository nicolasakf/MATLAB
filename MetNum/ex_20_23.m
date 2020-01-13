% Ex 20.23

clear
clc
close all

imshow(imread('ex_2023.png'));

distVet = [2.4,1.5,2.4,1.8,1.8,2.9,1.2,3,1.2];
largVet = [2.9,2.1,2.3,2.1,1.8,2.7,1.5,2.9,1.5];

%% item a)

figure();
plot(distVet,largVet,'o');
title('item a)');

%% item b)

[err,p] = minimos_quadrados_lin(distVet,largVet);

largVals = polyval(p,distVet);

figure();
plot(distVet,largVet,'o',distVet,largVals);
legend('dados','curva de ajuste');
title('item b)');

%% item c)

val = polyval(p,[2])

figure();
plot(distVet,largVet,'o',distVet,largVals,[2],val,'g*');
legend('dados','curva de ajuste','ponto desejado');
title('item c)');