num = 1;
den = poly([0 -4 -8 -10]);
G = tf(num,den);
rlocus(G)
display(G)