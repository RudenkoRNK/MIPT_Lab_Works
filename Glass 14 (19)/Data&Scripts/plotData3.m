% plot parameters
X1=log(data5(:,1));
Y1=log(data5(:,2));
%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure1=figure;
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
l=legend();

% final
title('');
xlabel('log');
ylabel('log');
hold off;
