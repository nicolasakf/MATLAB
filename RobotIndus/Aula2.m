T1 = SE2(1,2,30);
axis([0 5 0 5]);
trplot(T1, 'frame', '1', 'color', 'b');
T2 = SE2(2,1,0);
hold on;
trplot2(T2, 'frame', '2', 'color', 'r');
T3 = T1*T2;
trplot2(T3, 'frame', '3', 'color', 'g');
T4 = T2*T1;
trplot2(T4, '4', 'color', 'c');

P=[3;2]; %ponto em relacao a origem
plot_point(P,'*');