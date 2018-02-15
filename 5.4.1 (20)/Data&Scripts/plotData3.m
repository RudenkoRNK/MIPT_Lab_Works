% plot parameters
X3=data3(:, 2);
Y3=data3(:, 1);
%sort
s = [X3 Y3];
s = sortrows(s,1);
X3 = s(:, 1);
Y3 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot3
plot3 = plot(X3, Y3);
plot3.LineStyle = '--';
plot3.LineWidth = 0.5;
plot3.Color = 'k';
plot3.Marker = '.';
plot3.MarkerSize = 10;
plot3.MarkerEdgeColor = 'k';
plot3.MarkerFaceColor = 'k';


% legend
l=legend('I(P)');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.35 0.35 0.35];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of current on pressure');
xlabel('P torr');
ylabel('I pA');
hold off;
