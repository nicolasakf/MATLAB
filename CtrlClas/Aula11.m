                                
numG = 1;                   
denG = poly([0,-4,-6]);
G = tf(numG,denG);
rlocus(G);
zeta = 0.5;
wn = 0;
sgrid(zeta,wn);
pause;
[k,p] = rlocfind(G)
TS = feedback(43.44*G,1)
stepinfo(TS)