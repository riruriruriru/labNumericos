function [errores, raices] = newtonRaphsonM(x0, tol, n)
close all
syms x y z
%syms f1(x,y,z) f2(x,y,z) f3(x,y,z)
%F = [f1 f2 f3]
f1= (x^2)+y-37;
f2 = x - (y^2) -5;
f3 = x + y + z -3;

f = [f1;f2;f3];
v=[x,y,z];
R = jacobian(f,v);
Reval=subs(R,[x y z], [0 0 0]);
Feval=subs(f,[x y z], [0 0 0]);
error =10^(-15);
raices=[];
errores=[];
for i=1:500
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
    errores=[errores,e]

    
end
double(x0)
Feval=subs(f,[x y z], x0')
i
logErrores=log(errores);
end
%graphErrorNewtonRaphson(logErrores');