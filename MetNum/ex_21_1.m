% Ex 21.1

clear
clc

fx = @(x) 6+3*cos(x);

%% item a)

Ia = integral(fx,0,pi/2);

%% item b)

n = 1;
Ib = int_trapezio(0:pi/2/n:pi/2);
et_b = (Ia-Ib)/Ia*100;

%% item c)

% condicao 1
n = 2;
Ic1 = int_trapezio(0:pi/2/n:pi/2);
et_c1 = (Ia-Ic1)/Ia*100;

% condicao 2
n = 4;
Ic2 = int_trapezio(0:pi/2/n:pi/2);
et_c2 = (Ia-Ic2)/Ia*100;

%% item d)

n = 2;
Id = int_13Simpson(0:pi/2/n:pi/2);
et_d = abs((Ia-Id)/Ia*100);

%% item e)

n = 4;
Ie = int_13Simpson(0:pi/2/n:pi/2);
et_e = abs((Ia-Ie)/Ia*100);

%% item f)

n = 3;
If = int_38Simpson(0:pi/2/n:pi/2);
et_f = abs((Ia-If)/Ia*100);

%% item g)

n = 5;
interval = 0:pi/2/n:pi/2;
I38 = int_38Simpson(interval(1:4));
I13 = int_13Simpson(interval(4:6));
Ig = I38+I13;
et_g = abs((Ia-Ig)/Ia*100);

%% FINAL

tableaAns = table([Ia;Ib;Ic1;Ic2;Id;Ie;If;Ig],...
                  [0;et_b;et_c1;et_c2;et_d;et_e;et_f;et_g],...
                  'RowNames',{'item a)','item b)','item c1)','item c2)','item d)','item e)','item f)','item g)'},...
                  'VariableNames',{'Valor','Erro_Verdadeiro'})