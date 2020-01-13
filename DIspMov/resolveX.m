function x = resolveX(w)

if (nargin < 2)
    x0 = pi/2;
end

x0 = pi/2;
m = 0.108;
L = 0.053;
r1 = 0.03;
k = 689.2;
w = w*0.10472;

A = [ -1 ; 1 ];
b = [ 0 ; pi/2 ];

[theta,F] = fmincon(@(theta)funcao(theta,w,m,L,r1,k),x0,A,b);
x = 2*L*(1 - cos(theta));
display(x);

end

function F = funcao(theta,w,m,L,r1,k)
v = m*w^2*(L*sin(theta) + r1) - k*L*tan(theta) + k*L*sin(theta);
F = v^2;
end


