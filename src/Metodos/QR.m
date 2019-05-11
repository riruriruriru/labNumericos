function [x,error,contQR] = QR(A, b)
x=[];
[m, n] = size(A);
R = zeros(n, n);
V = A;
Q= zeros(m, n);

for i =1:n
    R(i,i)= norm(V(:,i));
    Q(:,i)= V(:,i)/R(i,i);
    for j=i+1:m
       R(i,j)= (Q(:,i)')*V(:,j);
       V(:,j)=V(:,j) - R(i,j)*Q(:,i);
       contQR = contQR+3+3*(n^2);
    end
    contQR = contQR+3;
end
x=inv(R)*Q'*b;
error = norm(eye(m)-inv(Q*R)*A);
contQR = contQR+4;
end