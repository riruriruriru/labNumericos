function [sol,Error,contador1Doo,contador2Doo] = doolittle(A, b)
[m,n] = size(A);
L = zeros(n, n);
U = zeros(n, n);
contador1Doo = 0;
contador2Doo = 0;
for k = 1:n
    L(k, k) = 1;
	for i = k + 1: m
	L(i,k) = A(i,k) / A(k,k);
		for j = k + 1 : n
			A(i,j) = A(i,j) - L(i,k)*A(k,j);
            contador1Doo = contador1Doo + 1;
            contador2Doo = contador2Doo + 1;
        end
        contador1Doo = contador1Doo + 1;
        contador2Doo = contador2Doo + 1;
    end
    for j = k : n
		U(k,j) = A(k,j);
    end
end
z = inv(L)*b;
sol = inv(U)*z;
Error = norm(eye(n)-inv(L*U)*A);
contador1Doo = contador1Doo + 1;
contador2Doo = contador2Doo + 4;
end

