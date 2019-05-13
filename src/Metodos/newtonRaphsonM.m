function [errores, raices] = newtonRaphsonM(x0, tol, n)
syms x y z
f1= (x^2)+y-37;
f2 = x - (y^2) -5;
f3 = x + y + z -3;

f = [f1;f2;f3];
v=[x,y,z];
R = jacobian(f,v);
error =10^(-15);
raices=[];
errores=[];
for i=1:n
    if abs(subs(f1,[x y z], x0'))<error && abs(subs(f2,[x y z], x0'))<error && abs(subs(f3,[x y z], x0'))<error
        break
    end
    
    Reval=subs(R,[x y z], x0');
    Feval=subs(f,[x y z], x0');
    X1=x0-Reval\Feval;
    x0=double(X1);
    raices=[raices,x0];
    e=[abs(subs(f1,[x y z], x0'));abs(subs(f2,[x y z], x0'));abs(subs(f3,[x y z], x0'))];
    e=double(e);
    errores=[errores,e];
    if e <= tol
        break;
    end

    
end

end
