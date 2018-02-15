% plot parameters
X4=data4(:,1)/10;
Y4=data4(:,2);
Xf=(0:0.001:2.5);
Yf=IFP(Xf, 5.16, 0.087, 1.16);
%sort
s = [X4 Y4];
s = sortrows(s,1);
X4 = s(:, 1);
Y4 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot4
plot4 = plot(X4, Y4);
plot4.LineStyle = 'none';
plot4.LineWidth = 0.5;
plot4.Color = 'k';
plot4.Marker = '.';
plot4.MarkerSize = 6;
plot4.MarkerEdgeColor = 'k';
plot4.MarkerFaceColor = 'k';
createFit(X4, Y4, 1.0);

%plot f
plotf = plot(Xf, Yf);
plotf.LineStyle = '-';
plotf.LineWidth = 1.5;
plotf.Color = 'k';
plotf.Marker = 'none';
plotf.MarkerSize = 6;
plotf.MarkerEdgeColor = 'k';
plotf.MarkerFaceColor = 'k';

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
