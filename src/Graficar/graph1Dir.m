function graph1Dir(v1, legend1,titulo,f)
figure1 = figure(f);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
plot([v1],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
ylabel('Aproximaciones') 
xlabel('Variables')
legend(legend1);
title(titulo)

end