function alpha = resolveAlpha(Beta)

X0 = pi/2;
h = 10;
l = 30;
b = 30;
Beta = Beta*pi/180;

A = [ -1 ; 1 ];
B = [ 0 ; pi/2 ];

[Alpha,F] = fmincon(@(Alpha)funcao(Alpha,Beta,h,l,b),X0,A,B);

alpha = (Alpha*180)/pi;
display(alpha);
display(F);

end

function F = funcao(Alpha,Beta,h,l,b)
v = ((h+l*sin(Beta) - (b*sin(Alpha)))^2) + (((l-l*cos(Beta) - (b-b*cos(Alpha))))^2) - h^2;
F = v^2;
end