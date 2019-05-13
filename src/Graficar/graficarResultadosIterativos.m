function graficarResultadosIterativos(resultadoJacobi, resultadoSeidel, titulo,f)

figure1 = figure(f);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
h = surf(resultadoJacobi,'FaceColor',[1 0 0],'FaceAlpha',0.5);
set(h,'LineStyle','none')
h2 = surf(resultadoSeidel,'FaceColor',[0 1 0],'FaceAlpha',0.5);
set(h2,'LineStyle','none')
title(titulo);
zlabel('Aproximaciones') 
xlabel('Iteraciones') 
ylabel('Variables');
legend('Gauss-Jacobi', 'Gauss-Seidel');
view(45,20)
end
