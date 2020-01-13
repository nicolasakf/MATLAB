
num=20;
den=poly([-2+j*4 -2-j*4]);
k = 10;
H=tf(num,den);
Heq = tf(H,1+k*H);
figure(1)
[yh,t]=step(Heq,3);

%plotting

plot(t,yh,'linewidth',1.5);
legend('H')
grid on;
figure(2)
pzmap(Heq);
xlim([-3 0.5]);
ylim([-10 10]);