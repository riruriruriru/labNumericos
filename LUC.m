function [L, U]=LUC(matrix)
%Function to carryout LU factorization using Crout's Algorithm
%By Mazhar Iqbal,NUST College of E&ME,Islamabad,Pakistan
m=length(matrix);
L=zeros(size(matrix));
U=zeros(size(matrix));
L(:,1)=matrix(:,1);
U(1,:)=matrix(1,:)/L(1,1);
U(1,1)=1;
for k=2:m
for j=2:m
    for i=j:m
        L(i,j)=matrix(i,j)-dot(L(i,1:j-1),U(1:j-1,j));
    end
    U(k,j)=(matrix(k,j)-dot(L(k,1:k-1),U(1:k-1,j)))/L(k,k);
end
end