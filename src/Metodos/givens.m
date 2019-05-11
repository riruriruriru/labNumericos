function [X,contGivens] = givens(A,b)
    [m , n] = size(A);
    Q = eye(m);
    R = A;
    contGivens = 0;
    for i=1:n
        for k=i+1:m
            if (R(k,i) ~= 0)
                raiz = sqrt(R(k,i)^2 + R(i,i)^2);
                s = -R(k,i)/raiz;
                c = R(i,i)/raiz;
                G = eye(m); % Matriz de rotacion
                G(i,i) = c;
                G(k,k) = c;
                G(k,i) = -s;
                G(i,k) = s;
                Q = Q*G; % Matriz ortogonal
                R = G'*R; % Matriz triangular inferior
                [n1,m1] = size(Q);
                [n2,m2] = size(R);
                [n3,m3] = size(G);
                contGivens = contGivens+4+(m1*n3)+(m3*n2);
            end
        end
        
    end
      Y = inv(Q)*b;
      X = inv(R)*Y;
      
end