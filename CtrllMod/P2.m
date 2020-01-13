% Nicolas Fonteyne
% Prova 2

%% Questao 3

disp(' ')
disp('QUESTAO 3')

A = [0 1; 0 -1];
B = [0; 1];
C = [10 0];
D = 0;

disp('item a)')

T = ss(A, B, C, D);
rlocus(T);

% por inspecao do grafico, queremos alocar os polos em -.5 +- 2.95i para que
% wn = 3 rad/s

K = place(A, B, [-.5+2.95i -.5-2.95i])

disp('item b)')

% por inspecao do grafico, queremos alocar os polos em -.5 +- 5i para que
% wn = 5 rad/s

G = place(A', C', [-.5+5i -.5-5i])'

%% Questao 4

disp(' ')
disp('QUESTAO 3')

A = [-.4 0 -.01; 1 0 0; -1.4 9.8 -.02];
B = [6.3; 0; 9.8];
C = [0 0 1];
D = 0;

disp('item a)')

polosK = [-1+i -1-i -2];

K = place(A, B, polosK)

disp('item b)')

polosG = [-4+6.9282i -4-6.9282i -8];

G = place(A', C', polosG)'
