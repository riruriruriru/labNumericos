function [X,Error,contador1Giv,contador2Giv] = givens(A,B)
    [m , n] = size(A);
    Q = eye(m);
    R = A;
    contador1Giv = 0;
    contador2Giv = 0;
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
                contador1Giv = contador1Giv + 1;
                contador2Giv = contador2Giv + 6;
            end
        end
        contador1Giv = contador1Giv + 1;
    end
      Y = inv(Q)*B;
      X = inv(R)*Y;
      Error = norm(eye(n)-inv(Q*R)*A);
      contador1Giv = contador1Giv + 1;
      contador2Giv = contador2Giv + 4;
end