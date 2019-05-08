function [x,Error,contador1Hou,contador2Hou] = Housholder(A,b)
    contador1Hou = 0;
    contador2Hou = 0;
    [m,n] = size(A);
    Q = eye(m);      
    R = A;
    %Transformormacion QR
    for j = 1:n 
        normx = norm(R(j:end,j));
        s     = -sign(R(j,j));
        u1    = R(j,j) - s*normx;
        w     = R(j:end,j)/u1;
        w(1)  = 1;
        tau   = -s*u1/normx;
        %Reemplazando
        R(j:end,:) = R(j:end,:)-(tau*w)*(w'*R(j:end,:));
        Q(:,j:end) = Q(:,j:end)-(Q(:,j:end)*w)*(tau*w)';
        contador1Hou = contador1Hou + 3;
        contador2Hou = contador2Hou + 10;
    end
    %Obtener resultado
    z = inv(Q)*b;
    x = inv(R)*z; 
    Error = norm(eye(m)-inv(Q*R)*A);
    contador1Hou = contador1Hou + 1;
    contador2Hou = contador2Hou + 4;
end