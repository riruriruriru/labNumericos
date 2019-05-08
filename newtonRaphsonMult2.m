function [raices, errores,contadorAritmetico1,contadorAritmetico2] = newtonRaphsonMult2(funciones, x0, tolerancia, n)
    jacobiano = jacobian(funciones);
    variables = findsym(funciones);
    raices = [];
    errores = [];
    contadorAritmetico1 = 0;
    contadorAritmetico2 = 0;
    for i = 1 :n
        feval = subs(funciones, variables, x0);
        jeval = subs(jacobiano, variables, x0);
        jacoInv = inv(jeval);
        x1 = x0 - multiplicarMatrices(jacoInv, feval');
        raices = [raices , x1];
        e = norm(x1 - x0, inf)/norm(x1, inf);
        errores = [errores , e];
        x0 = x1;
        if(e < tolerancia)
            break;
        end
        contadorAritmetico1 = contadorAritmetico1 + 2; 
        contadorAritmetico2 = contadorAritmetico2 + 1;
    end
end