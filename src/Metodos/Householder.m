function [x,contHouseholder] = Householder(A,b)
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
        [nn,mm] = size(tau);
        [nn1,mm1] = size(w);
        [a1,b1] = size(R(j:end,j));
        R(j:end,:) = R(j:end,:)-(tau*w)*(w'*R(j:end,:));
        Q(:,j:end) = Q(:,j:end)-(Q(:,j:end)*w)*(tau*w)';
        [aa,bb] = size(R(j:end,:));
        [aa1,bb2] = size(Q(:,j:end));
        contHouseholder = contHouseholder +(nn1*mm1)+4*(mm*nn)+(a1*b1)+(j*j)+(aa*bb)+(aa1*bb2);
    end
    z = inv(Q)*b;
    x = inv(R)*z; 
    contHouseholder =contHouseholder+5+3*n;
end