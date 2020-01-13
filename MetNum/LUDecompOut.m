function [L,U] = LUDecompOut(A)

z=size(A,1);

L=zeros(z,z);

U=zeros(z,z);

for i=1:z

% Finding L

for k=1:i-1

L(i,k)=A(i,k);

for j=1:k-1

L(i,k)= L(i,k)-L(i,j)*U(j,k);

end

L(i,k) = L(i,k)/U(k,k);

end

% Finding U

for k=i:z

U(i,k) = A(i,k);

for j=1:i-1

U(i,k)= U(i,k)-L(i,j)*U(j,k);

end

end

end

L(1,1) = 1;
L(2,2) = 1;
L(3,3) = 1;

end