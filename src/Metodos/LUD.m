function [L, U]=LUD(matrix)
%Function to carryout LU factorization using DooLittlle's Algorithm
%By Mazhar Iqbal,NUST College of E&ME,Islamabad,Pakistan
[m n]=size(matrix);
L=zeros(size(matrix));
U=zeros(size(matrix));
U(1,:)=matrix(1,:);
L(:,1)=matrix(:,1)/U(1,1);
L(1,1)=1;
for k=2:m
for i=2:m
    for j=i:m
        U(i,j)=matrix(i,j)-dot(L(i,1:i-1),U(1:i-1,j));
    end
    L(i,k)=(matrix(i,k)-dot(L(i,1:k-1),U(1:k-1,k)))/U(k,k);
end
end