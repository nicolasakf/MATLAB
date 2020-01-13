
clear
clc

%% Ex. 27.4

edo = @(x,y) 7*y''-2*y'-y+x;

[x,y] = shooting_method(edo,0.5,1e-6,0,20,[5,8],'fd',[-10,10])

%% Ex 27.5