function [soluciones, errores,contSeidel] = gaussSeidel(A, b, tol)
    [n ,n] = size(A);
    D = zeros(n, n); %Se crean las matrices D, E y F
    E = zeros(n, n);
    F = zeros(n, n);
    aux = 1;
    contSeidel = 0;
    for i = 1 : n
       D(i, i) = A(i, i);
       for j = 1 : aux
          E(i, j) = A(i, j); 
          F(j, i) = A(j, i);
       end
       E(i, i) = 0;
       F(i, i) = 0;
       aux = aux + 1;
       
    end
    x0 = zeros(n ,1);
    soluciones = [];
    errores = [];
    for i = 1 : 100000
       j = inv(D+E) * -F;
       c = inv(D+E) * b;
       x1 = j*x0 + c;%se calcula la aproximacion de la iteracion actual
       e = norm(x1 - x0, inf)/norm(x1, inf);%se calcula el error de la iteracion actual
       soluciones = [soluciones, x1]; %se guarda la aproximacion de la iteracion actual
       errores = [errores, e]; %Se actualiza el error segun la iteracion actual
       [aa,bb] = size(j);
       [a1,b1] = size(c);
       [a2,b2] = size(e);
       contSeidel = contSeidel+2+(a1*b1)+(aa*bb);
       if(e < tol) %si se alcanza la tolerancia, se finaliza
           break
       end
       x0 = x1;
    end
    contSeidel = contSeidel+2;
end