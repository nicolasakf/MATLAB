% Questao 5

A = [0 1 0 0;3 0 0 2;0 0 0 1;0 -2 0 0];
B = [0 0;1 0;0 0;0 1];
C = [1 0 0 0;0 0 1 0];

n = 4;

%% item a)

disp('Caso: ambos propulsores')

Qc = ctrb(A,B);
if rank(Qc) == n
    disp('o sistema é completamente controlavel!')
else
    disp('o sistema não é completamente controlavel!')
end

%% item b) testando os propulsores
disp('Caso: propulsor 1')
Bu1 = [0 0;1 0;0 0;0 0];
Qcu1 = ctrb(A,Bu1);
if rank(Qcu1) == n
    disp('o sistema é completamente controlavel!')
else
    disp('o sistema não é completamente controlavel!')
end

disp('Caso: propulsor 2')
Bu2 = [0 0;0 0;0 0;0 1];
Qcu2 = ctrb(A,Bu2);
if rank(Qcu2) == n
    disp('o sistema é completamente controlavel!')
else
    disp('o sistema não é completamente controlavel!')
end