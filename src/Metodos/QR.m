function [x,contQR] = QR(A, b)
x=[];
[m, n] = size(A);
R = zeros(n, n);
V = A;
Q= zeros(m, n);
contQR = 0;
for i =1:n
    R(i,i)= norm(V(:,i));
    Q(:,i)= V(:,i)/R(i,i);
    for j=i+1:m
       R(i,j)= (Q(:,i)')*V(:,j);
       V(:,j)=V(:,j) - R(i,j)*Q(:,i);
       [a1,b1] = size(R(i,j));
       [aa,bb] = size(V(:,j));
       [aaa,bbb] = size(Q(:,i));
       contQR = contQR+(a1*b1)+(aa*bb)+(aaa*bbb);
    end
    [a2,b2] = size(Q(:,i));
    contQR = contQR+(a2*b2)+3*n;
end
x=inv(R)*Q'*b;
contQR = contQR+4;
end