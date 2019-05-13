function graphErrorNewtonRaphson(error)

figure1 = figure;

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'on');

plot1 = plot(error,'Parent',axes1);
set(plot1(1),'DisplayName','errores(:,1)');
set(plot1(2),'DisplayName','errores(:,2)');
set(plot1(3),'DisplayName','errores(:,3)');

xlabel('Iteracion');

ylabel('Errores');

legend(axes1,'show');
legend('x1','x2','x3');
title("Error newton raphson");
