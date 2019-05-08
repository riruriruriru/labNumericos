function graficarValoresIt(vj, vs, nombre)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

surf(vj,'FaceColor',[1 0 0],'FaceAlpha',0.5);
surf(vs,'FaceColor',[0 1 0],'FaceAlpha',0.5);
title(nombre);
zlabel('Aproximaciones') % y-axis label
xlabel('Iteraciones') % x-axis label
ylabel('Variables');
legend('Gauss-Jacobi', 'Gauss-Seidel');
view(45,20)
end
