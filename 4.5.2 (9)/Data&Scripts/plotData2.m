% plot parameters

%sort
s = [X4 Y4];
s = sortrows(s,1);
X4 = s(:, 1);
Y4 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X4, Y4);
plot1.LineStyle = '--';
plot1.LineWidth = 0.8;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% legend
l=legend('\nu_{2}(x)');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='best';


% final
title('Dependence of \nu_{2} on block location');
xlabel('x, cm');
ylabel('\nu_{2}');
hold off;
