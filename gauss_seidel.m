function [resultado, iter, error] = gauss_seidel(A, b, itr, tol)
[n,m] = size(A);
resultadoParcial = zeros(m,1);
resultado = zeros(m,1);
normVal=Inf; 
error = 0;
itr1 = 0
%% 
% * _*Tolerence for method*_
tol=1e-5;
%% Algorithm: Gauss Seidel Method
%%
while normVal>tol
    resultadoParcial=resultado;
    if itr1>=itr
        break;
    end
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*resultado(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*resultadoParcial(j);
        end
        
        resultado(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr1=itr1+1;
    normVal=norm(resultadoParcial-resultado);
    iter = itr1;
end



end