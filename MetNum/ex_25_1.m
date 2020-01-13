% Ex 25.1

% Dados do problema

close all
clear
clc

y1 = 1;
y2 = 1;
h = 0.05;
t_init = 0;
t_final = 2;
x = t_init:h:t_final;

%% grafico da solucao analitica

it = 1;
for t = x
    yanal(it) = exp(1/3*t^3-1.1*t);
    it = it+1;
end

%% solucao numerica - RK 4a ordem
                                                                                   
y = zeros(1,length(x)); 
y(1) = 1;                                          
F_xy = @(t,r) r*t^2-1.1*r;                   

for i=1:(length(x)-1)                           
    k_1 = F_xy(x(i),y(i));
    k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k_4 = F_xy((x(i)+h),(y(i)+k_3*h));

    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
end

%% FINAL

plot(x,yanal,x,y,'o');
legend('solucao analitica','solucao numerica');

