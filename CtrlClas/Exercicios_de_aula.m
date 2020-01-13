%% Ex.1 - Esbo?o do LGR e Pontos Cr?ticos

clear all;
clf;
numGH = [1,-4,20];
denGH = poly([-2,-4]);
GH = tf(numGH,denGH);
rlocus(GH);
zeta = 0.2:0.05:0.5;
wn = 0:1:10;
sgrid(zeta,wn);

%% Ex.2 - Esbo?o do LGR e Pontos Cr?ticos

