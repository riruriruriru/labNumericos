function matrizError = construirMatrizError(Real,Real2,Real3, Aprox1, Aprox2,Aprox3)

[n,m] = size(Aprox1);
[n2,m2] = size(Aprox2);
[n3,m3] = size(Aprox3);
matrizError = zeros(3,m);
for i = 1:3
    
    for j = 1:m
        if i ==1
            matrizError(i,j) = errorRelativo(Real,Aprox1(:,j));
        elseif i == 2
            matrizError(i,j) = errorRelativo(Real2,Aprox2(:,j));
        else
            matrizError(i,j) = errorRelativo(Real3,Aprox3(:,j));
        end
    end
end
end