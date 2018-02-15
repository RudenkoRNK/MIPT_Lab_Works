collectData;

% make new space
figure;
hold on;
grid on;

fitcoefs={};
fiterrs={};
leg={};
for k=1:3
    X=data{k}(:,1);
    Y=data{k}(:,2);
    N0=Y(1)^2/Y(2);
    Y=log(N0./Y);
    plotData;
end


% legend
l=legend(leg);
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of ln(N_0/N) on thickness');
xlabel('l, cm');
ylabel('ln$\frac{N_0}{N}$','Interpreter','latex');
hold off;