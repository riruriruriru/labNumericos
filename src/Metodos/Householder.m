function [x,Error,contHouseholder] = Householder(A,b)
    contHouseholder = 0;
    [m,n] = size(A);
    %Se descompone en forma QR, primero creando las matrices Q y R
    Q = eye(m);      
    R = A;
    for j = 1:n 
        normx = norm(R(j:end,j));
        s     = -sign(R(j,j));
        u1    = R(j,j) - s*normx;
        w     = R(j:end,j)/u1;
        w(1)  = 1;
        tau   = -s*u1/normx;
        [nn,mm] = size(w);
        R(j:end,:) = R(j:end,:)-(tau*w)*(w'*R(j:end,:));
        Q(:,j:end) = Q(:,j:end)-(Q(:,j:end)*w)*(tau*w)';
        contHouseholder = contHouseholder +15;
    end
    z = inv(Q)*b;
    x = inv(R)*z; 
    Error = norm(eye(m)-inv(Q*R)*A);
    contHouseholder =contHouseholder+5+3*n;
end