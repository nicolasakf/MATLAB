
lVector = [];
dVector = 0:.01:1;

for d = dVector
    
    a = 9810;
    b = - 110810 - (9810*d);
    c = 9810*d;
    
    [l,erro,it] = bissecao([a,b,c],0,1,0.0001);
    
    lVector = [lVector,l];
    
end

plot(dVector,lVector,'LineWidth',2)

