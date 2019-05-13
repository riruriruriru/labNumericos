function graphTimeAlgoritmo(tiempos,titulo,name1,name2,name3,f)

figure1 = figure(f);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'on');

xlabel('Metodo');

ylabel('Tiempo (s)');
title(titulo);
c = {name1,name2,name3};
bar(tiempos)
set(gca, 'XTick', 1:3, 'XTickLabel', c);
