% Questao 4

%% item a)
A = [-2 1; 0 -3];
B = [1; 1];
C = [1 3];
D = 0;

disp('verificando a controlabilidade do sistema...')
Qc = ctrb(A,B);

if det(Qc) ~= 0
    disp('o sistema é completamente controlavel!')
end

polos = [-3+3i -3-3i];
K = place(A, B, polos)

%% item b)

T = ss(A-B*K, B, C, D);

N = inv([A B; C D])*[0 0 1]';
Nx = N(1:2);
Nu = N(3);
Nbar = Nu+K*Nx