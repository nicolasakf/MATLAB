% Exerc?cio 13.22
% N?colas Fonteyne - 6 MECAT

h = 4;
D = 4;

R = (sqrt(5)-1)/2;

es = 0.003; % em (%)
ea = es+1;

i = 1;

xu = 10;
xl = 5;
xopt = 0;

while ea > es
    
   d = R*(xu-xl);
   x1 = xl+d;
   x2 = xu-d;
   
   fx1 = sqrt(((x1*h)/(x1-D))^2+x1^2);
   fx2 = sqrt(((x2*h)/(x2-D))^2+x2^2);
   
   if fx1 < fx2
      
      xl = x2;
      xopt = x2;
   
   else
      
      xu = x1;
      xopt = x1;
       
   end
   
   ea = ((1-R)*abs((xu-xl)/xopt))*100;
   
   i = i+1;
   
end

i
l = sqrt(((xopt*h)/(xopt-D))^2+xopt^2)
ea
