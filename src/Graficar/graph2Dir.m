function graph2Dir(v1, v2, legend1,legend2,titulo,f)
figure1 = figure(f);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
subplot(2,1,1);
plot([v1],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
ylabel('Aproximaciones') 
xlabel('Variables')
legend(legend1);
title(titulo)
subplot(2,1,2);
plot([v2],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
legend(legend2);
ylabel('Aproximaciones') 
xlabel('Variables')
title(titulo)
end