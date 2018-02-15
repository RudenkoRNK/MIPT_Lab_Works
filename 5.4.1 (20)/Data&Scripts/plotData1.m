% plot parameters
X1=data1(:, 2);
Y1=data1(:, 1)./data1(:,3);
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
plot1.LineWidth = 0.5;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


% legend
l=legend('N(X)');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northeast';


% final
title('Dependence of count speed on distance to Geiger sensor');
xlabel('X mm');
ylabel('N s^-^1');
hold off;
