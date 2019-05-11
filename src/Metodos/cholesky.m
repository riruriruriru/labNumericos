function [x,error,contCholesky]=cholesky(A, b)
    [n,m]=size(A);
    contCholesky = 0;
    for k = 1 : n
        A(k,k) = sqrt(A(k,k));
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        for j = k + 1 : n
            A(j:n,j) = A(j:n,j) - A(j,k)*A(j:n,k);
            [a,b] = size(A(j:n,k));
            [aa,bb] = size(A(j:n,j));
            contCholesky = contCholesky + (aa*bb)+(a*b);
        end
        [a,b] = size(A(k+1:n,k));
        contCholesky = contCholesky+(a*b);
    end
    L = tril(A);
    LT = L';
    z = inv(L)*b;
    x = inv(LT)*z;
    error = norm(eye(n)-inv(L*LT)*A);
    %contCholesky = contCholesky+4*(n*n);
end
