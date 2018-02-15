% plot parameters

%sort
% make new space
figure;
hold on;
grid on;

markers = '+o*x';
styles = '- --: -.';
fitcoefs = zeros(4);
% plot1
for i=1:n
    plot1 = plot(X, Y(:, i));
    plot1.LineStyle = 'none';
    plot1.LineWidth = 0.8;
    plot1.Color = 'k';
    plot1.Marker = markers(i);
    plot1.MarkerSize = 5;
    plot1.MarkerEdgeColor = 'k';
    plot1.MarkerFaceColor = 'k';
    
    fit1=fit(X, Y(:, i),'poly1');
    fit1Plot=plot(fit1);
    fit1Coefs=coeffvalues(fit1);
    fitcoefs(i) = fit1Coefs(1);
    fit1Plot.LineStyle = styles(2*i-1:2*i);
    fit1Plot.LineWidth = 1.0;
    fit1Plot.LineJoin = 'round';
    
end

% legend
l=legend('\nu = 1.5852MHz',...
         strcat('fit=',num2str(fitcoefs(1), '%5.1f')),...
         '\nu = 1.9445MHz', ...
         strcat('fit=',num2str(fitcoefs(2), '%5.1f')),...
         '\nu = 1.2659MHz', ...
         strcat('fit=',num2str(fitcoefs(3), '%5.1f')),...
         '\nu = 1.0309MHz',...
         strcat('fit=',num2str(fitcoefs(4), '%5.1f')));
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northeast';


% final
title('Dependence of Y on order');
xlabel('m');
ylabel('Y');
hold off;
