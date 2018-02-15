% plot parameters
X5=data5(:,1)/10;
Y5=data5(:,2);
%sort
s = [X5 Y5];
s = sortrows(s,1);
X5 = s(:, 1);
Y5 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot5
plot5 = plot(X5, Y5);
plot5.LineStyle = 'none';
plot5.LineWidth = 0.5;
plot5.Color = 'k';
plot5.Marker = '.';
plot5.MarkerSize = 6;
plot5.MarkerEdgeColor = 'k';
plot5.MarkerFaceColor = 'k';
createFit(X5, Y5, 1.0);

% legend
l=legend('I(d)');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Transparency Characteristics');
xlabel('d, mm');
ylabel('I');
hold off;
