function [x,ea,it] = brent(func,a,b,es)

% input:
% func = name of function
% a,b = limits of the interval containing the x
% es = error tolerance (default is 1.0e6*eps)

% output:
% x = real x (x = NaN if failed to converge).

if nargin < 4; es = 1.0e6*eps; end
% First step is bisection
x1 = a; f1 = feval(func,x1);
if f1 == 0; x = x1; return; end
x2 = b; f2 = feval(func,x2);
if f2 == 0; x = x2; return; end
if f1*f2 > 0.0
    error('Root is not bracketed in (a,b)')
end
x3 = 0.5*(a + b);
% Beginning of iterative loop.
for i = 1:30
    it = i;
    f3 = feval(func,x3);
    ea = abs(f3)/100;
    if abs(f3) < es
        x = x3; return
    end
    % Tighten brackets (a,b) on the x.
    if f1*f3 < 0.0; b = x3;
    else; a = x3;
    end
    if (b - a) < es*max(abs(b),1.0)
        x = 0.5*(a + b); return
    end
    % Try quadratic interpolation.
    denom = (f2 - f1)*(f3 - f1)*(f2 - f3);
    numer = x3*(f1 - f2)*(f2 - f3 + f1)...
        + f2*x1*(f2 - f3) + f1*x2*(f3 - f1);
    % If division by zero, push x out of bracket
    % to force bisection.
    if denom == 0; dx = b - a;
    else; dx = f3*numer/denom;
    end
    x = x3 + dx;
    % If interpolation goes out of bracket, use bisection.
    if (b - x)*(x - a) < 0.0
        dx = 0.5*(b - a); x = a + dx;
    end
    % Let x3 <-- x & choose new x1, x2 so that x1 < x3 < x2.
    if x < x3
        x2 = x3; f2 = f3;
    else
        x1 = x3; f1 = f3;
    end
    x3 = x;
end
x = NaN;