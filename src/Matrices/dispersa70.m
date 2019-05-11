function [bool,cont] = dispersa70(A)
bool = 0;
cont = 0;
[n,m] = size(A);
for i=1:n
    for j=1:m
        if A(i,j) == 0
            cont = cont +1;
        end
    end
end

if cont >= 0.7*n*n
    bool = 1
end
end