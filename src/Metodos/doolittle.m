function [L,error,contDoo] = doolittle(A, b)
    n = length(b);
    contDoo = 0;
    error = 0;
    L = zeros(n, 1);
    U = zeros(n, 1);
    % decomposition of matrix, Doolittle’s Method
    for i = 1:1:n
        for j = 1:1:(i - 1)
            alpha = A(i,j);
            for k = 1:1:(j - 1)
                alpha = alpha - A(i,k)*A(k,j);
                contDoo = contDoo+2;
            end
            A(i,j) = alpha/A(j,j);
            contDoo = contDoo+1;
        end
        for j = i:1:n
            alpha = A(i,j);
            for k = 1:1:(i - 1)
                alpha = alpha - A(i,k)*A(k,j);
                contDoo = contDoo+2;
            end
            A(i,j) = alpha;
        end
    end
    %A = L+U-I
    % find solution of Ly = b
    for i = 1:1:n
        alpha = 0;
        for k = 1:1:i
            alpha = alpha + A(i,k)*U(k);
            contDoo = contDoo+2;
        end
        U(i) = b(i) - alpha;
        contDoo = contDoo+1;
    end
    % find solution of Ux = y
    for i = n:(-1):1
        alpha = 0;
        for k = (i + 1):1:n
            alpha = alpha + A(i,k)*L(k);
            contDoo = contDoo+2;
        end
        L(i) = (U(i) - alpha)/A(i, i);
        contDoo = contDoo+2;
    end
    I = eye(n,n);
    error = norm(I-inv(L*U)*A);

end