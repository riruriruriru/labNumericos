function graficarDirectosConGivens(doolittle, housholder, cholesky,qr,givens)
[n,m] = size(doolittle)
subplot(3,2,1);
plot([doolittle],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('Doolittle');
subplot(3,2,2);
plot([cholesky],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('Cholesky');
subplot(3,2,3);
plot([qr],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('QR');
subplot(3,2,4);
plot([givens],'pc','MarkerSize',2,'MarkerFaceColor','c'); hold on;
ylabel('Resultados')
xlabel('Variables') 
legend('Givens');
subplot(3,2,5);
plot([housholder],'ok','MarkerSize',2,'MarkerFaceColor','k'); hold on;
ylabel('Resultados') 
xlabel('Variables') 
legend('Householder');


end