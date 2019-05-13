function [resultado, error,contJacobi] = gaussJacobi(A, b, tol)
    [M ,N] = size(A);
    D = zeros(M, N);
    E = zeros(M, N);
    F = zeros(M, N);
    aux = 1;
    contJacobi = 0;
    for i = 1 : M
       D(i, i) = A(i, i);
       for j = 1 : aux
          E(i, j) = A(i, j); 
          F(j, i) = A(j, i);
       end
       E(i, i) = 0;
       F(i, i) = 0;
       aux = aux + 1;
       contJacobi = contJacobi+1;
    end
    x0 = zeros(N ,1);
    resultado = [];
    error = [];
    for i = 1 : 1000
       j = inv(D)*(-E-F);
       c = inv(D) * b;
       x1 = j*x0 + c;
       e = norm(x1 - x0, inf)/norm(x1, inf);
       resultado = [resultado, x1];
       error = [error, e];
       [aa,bb] = size(j);
       [a1,b1] = size(c);
       [a2,b2] = size(e);
       contJacobi = contJacobi+2+(a1*b1)+(aa*bb);
       if(e < tol)
           break
       end
       x0 = x1;
       
    end
    xs = x1;
    contJacobi = contJacobi+2;
end