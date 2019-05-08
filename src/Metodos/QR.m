function [X,Error,contador1QR,contador2QR] = QR(A, b)
X=[];
[m, n] = size(A);
R = zeros(n, n);
V = A;
Q=zeros(m, n);
contador1QR = 0 ;
contador2QR = 0 ;
for i =1:n
    R(i,i)= norm(V(:,i));
    Q(:,i)= V(:,i)/R(i,i);
    for j=i+1:m
       R(i,j)= (Q(:,i)')*V(:,j);
       V(:,j)=V(:,j) - R(i,j)*Q(:,i);
       contador1QR = contador1QR + 1 ;
       contador2QR = contador2QR + 2 ;
    end
    contador2QR = contador2QR + 1 ;
end
X=inv(R)*Q'*b;
Error = norm(eye(m)-inv(Q*R)*A);
contador1QR = contador1QR + 1;
contador2QR = contador2QR + 4;
end