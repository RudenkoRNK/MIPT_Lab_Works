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
plot1.LineWidth = 0.5;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 6;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% legend
l=legend(strcat('I(U); U cathode=', num2str(CathodeV1), 'V'));
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('IU Characteristics');
xlabel('U, V');
ylabel('I, mV');
hold off;
