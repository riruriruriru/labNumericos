function [x,Error,contador1Cho,contador2Cho]=cholesky(A, b)
    [N,M]=size(A);
    contador1Cho = 0;
    contador2Cho = 0;
    for k = 1 : N
        A(k,k) = sqrt(A(k,k));
        A(k+1:N,k) = A(k+1:N,k)/A(k,k);
        for j = k + 1 : N
            A(j:N,j) = A(j:N,j) - A(j,k)*A(j:N,k);
            contador1Cho = contador1Cho + 1;
            contador2Cho = contador2Cho + 1;
        end
        contador1Cho = contador1Cho + 1;
        contador2Cho = contador2Cho + 1;
    end
    L = tril(A);
    LT = L';
    z = inv(L)*b;
    x = inv(LT)*z;
    Error = norm(eye(N)-inv(L*LT)*A);
    contador1Cho = contador1Cho + 1;
    contador2Cho = contador2Cho + 4;
end
