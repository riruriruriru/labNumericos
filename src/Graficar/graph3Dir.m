function graph3Dir(v1, v2, v3,legend1,legend2,legend3,titulo,f)
figure1 = figure(f);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
subplot(3,1,1);
plot([v1],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
ylabel('Aproximaciones') 
xlabel('Variables')
legend(legend1);
title(titulo)
subplot(3,1,2);
plot([v2],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
legend(legend2);
ylabel('Aproximaciones') 
xlabel('Variables')
title(titulo)
subplot(3,1,3);
plot([v3],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
legend(legend3);
ylabel('Aproximaciones') 
xlabel('Variables') 
title(titulo)
end