function answer = bairstow (degree, coeff, r, s, maxit, errmax)

scoff=coeff;
sdegree=degree;
arrc=[];
d=degree;
arrb=[];
flag=0;
count=0;

while(degree>0)

for j=1:maxit

d=degree;
arrb(d+1)=coeff(d+1);
arrb(d)=coeff(d)+r*arrb(d+1);
d=d-2;

while(d>=0)
arrb(d+1)=coeff(d+1) + r*arrb(d+2) + s*arrb(d+3);
d=d-1; 
end

d=degree;
arrc(d+1)=arrb(d+1);
arrc(d)=arrb(d)+ r*arrc(d+1);    
d=d-2;

while(d>=0)
arrc(d+1)=arrb(d+1) + r*arrc(d+2) + s*arrc(d+3);
d=d-1; 
end

ds = ( arrb(1)*arrc(3) - arrb(2)*arrc(2) )/( arrc(4)*arrc(2) - arrc(3)*arrc(3) );
dr = ( arrb(1)*arrc(4) - arrb(2)*arrc(3) )/( arrc(3)*arrc(3) - arrc(2)*arrc(4) );
r=r+dr;
s=s+ds;

err_r = abs(dr/r)*100 ;
err_s = abs(ds/s)*100 ;

if ( errmax > err_s ||  errmax > err_r )

root1 = ( r + sqrt(r*r + 4*s) )/2;
root2 = ( r - sqrt(r*r + 4*s) )/2;
fprintf('Solution is ');

if(count==0)
 fprintf(' %f %f ',root1,root2);
end
count=1;
flag=1;
break; 
end

end

if flag==0
break;
end

for i=1:degree-1
coeff(i)=arrb(i+2);
end

degree=degree-2;

if degree == 2
root1 = ( -(arrb(4)) + sqrt(arrb(4)*arrb(4) - 4*arrb(3)*arrb(5)) )/(2*arrb(5));
root2 = ( -(arrb(4)) - sqrt( arrb(4)*arrb(4) - 4*arrb(3)*arrb(5) ))/(2*arrb(5));
fprintf('%f %f\n ',root1,root2);
break;

elseif degree == 1
root = -arrb(3)/arrb(4);
fprintf('%f\n ',root);
break;

end      

end 

f=zeros(1,101);


for k=-50:50

for i=1:sdegree+1

f(k+51)=f(k+51)+scoff(i)*((k)^(i-1));

end

end

x=-50:50;  
plot(x,f);grid on;xlabel('x');ylabel('f(x)');title('f(x)vs x');
ax=gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
end
