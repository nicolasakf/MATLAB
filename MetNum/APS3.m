
% APS 3
% Nicolas Fonteyne

%% Ex. 11.13

disp('Ex. 11.13');

A = [-8,1,-2;2,-6,-1;-3,-1,7];
B = [-20;-38;-34;];

% item a)
disp('item a)');
Xa = GaussSeidel(A,B,5,1,100,true)

% item b)
disp('item b)');
Xb = GaussSeidel(A,B,5,1.2,100,true)

disp('-------------------------------------------------------------------');

%% Ex. 11.18

disp('Ex. 11.18');

A = [4,3,2;1,3,1;2,1,3];
B = [960;510;610];

X = GaussNaive(A,B,true)

disp('-------------------------------------------------------------------');

%% Ex. 13.8

disp('Ex. 13.8');

 % item a)
disp('item a)');
Xa = r_aurea_max(-2,1,100,1)

 % item b)
disp('item b)');
Xb = inter_parab_max(-2,-1,1,1,4)

 % item c)
disp('item c)');
Xc = newton_optimal(-1,1,100)
