function [X,contGivens] = givens(A,b)
%GIVENS Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(A);
Q=eye(m);
contGivens = 0;
contAux = 0;
for j=1:n
    for i=1(j+1):m;
        if A(i,j)~=0
            xi = A(i,j);
            xj = A(i,j);
            [G,contAux] = makeGivens(m,i,j,xi,xj);
            Q = Q*G';
            A = G*A;
            [n1,m1] = size(A);
            [n2,m2] = size(Q);
            [n3,m3] = size(G);
            contGivens = contGivens+2 + contAux + (n1*m1)+(n2*m2)+(n3*m3);
        end
    end
end
%r = triu(A);

X=inv(A) * Q' * b;
[n4,m4] = size(b);
[n5,m5] = size(Q);
contGivens = contGivens + (m4*n5)+(n*m5)+(n*m);
end