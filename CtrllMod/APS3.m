% Nicolas Fonteyne - Controle Moderno
% APS 3

close all
clear
clc

%% Ex. 1

%% Ex. 2

A = [0 1 0; 0 0 1; -7 -5 -3];
B = [0; 0; 5];
C = [2 -5 0];
D = 0;

Qobs = [C; C*A; C*A^2];

if rank(Qobs) == 3
    disp('o sistema é observável!');
    p = [-1+j -1-j -5];
    G = place(A',C',p)'
else
    disp('o sistema não é observável!')
end


%% Ex. 3

% b)

% repr 1
A1 = [0 1; -2 -3];
B1 = [0; 1];
C1 = [2 0];

Qobs1 = [A; C*A];

if rank(Qobs1) == 2
    disp('o sistema é observavel!')
else
    disp('o sistema não é observavel!')
end

% repr 2
A2 = [0 1 0; 0 0 1; -6 -11 -6];
B2 = [0; 0; 1];
C2 = [6 2 0];

Qobs2 = [A; C*A; C*A^2];

if rank(Qobs2) == 3
    disp('o sistema é observavel!')
else
    disp('o sistema não é observavel!')
end


%% Ex. 6

% b)

A = [-1 1; 1 -2];
B = [1; 1];
C = [2 1];
D = 0;

p = [-5 -10];
G = place(A',C',p)'
