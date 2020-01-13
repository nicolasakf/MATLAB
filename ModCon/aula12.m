% Vamos criar uma fun??o de transfer?ncia com ganho unit?rio e p?los em $s_1=-2+j*4, s_2=-2-j*4

num=20;
den=poly([-2+j*4 -2-j*4]);
H=tf(num,den);
figure(1)
[yh,t]=step(H,3);

%plotting

plot(t,yh,'linewidth',1.5);
legend('H')
grid on;
figure(2)
pzmap(H);
xlim([-3 0.5]);
ylim([-10 10]);