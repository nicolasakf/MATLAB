function [Err, P] = minimos_quadrados_lin(XData, YData)

kx=length(XData);
ky=length(YData);
if kx ~= ky
   disp('Incompatible X and Y data.');
   close all;
end
%
xp=mean(XData);
yp=mean(YData);
%
xs=XData-xp;
ys=YData-yp;
%
D=[xs,ys];
[U,S,V]=svd(D);
%
l1=V(1,1);
l2=V(1,2);
l3=-(l1*xp+l2*yp);
%
a=-l3/l2;
b=-l1/l2;
%
Yhat = XData.*b + a;
Xhat = ((YData-a)./b);
alpha = atan(abs((Yhat-YData)./(Xhat-XData)));
d=abs(Xhat-XData).*sin(alpha);
%
[P,Err]=polyfit(XData,YData,1);
%
         
end    