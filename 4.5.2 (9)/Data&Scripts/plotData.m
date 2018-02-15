% plot parameters

%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = '--';
plot1.LineWidth = 0.8;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% plot2
plot2 = plot(X2, Y2);
plot2.LineStyle = ':';
plot2.LineWidth = 2;
plot2.Color = 'k';
plot2.Marker = 'none';
plot2.MarkerSize = 6;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';

% plot3
plot3 = plot(X3, Y3);
plot3.LineStyle = '-.';
plot3.LineWidth = 1.3;
plot3.Color = 'k';
plot3.Marker = 'none';
plot3.MarkerSize = 6;
plot3.MarkerEdgeColor = 'k';
plot3.MarkerFaceColor = 'k';

% legend
l=legend('\nu_{3}(\beta)',...
         'cos \beta', ...
         'cos^{2} \beta');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northeast';


% final
title('Dependence of \nu_{3} on angle');
xlabel('\beta, rad');
ylabel('\nu_{3}');
hold off;
