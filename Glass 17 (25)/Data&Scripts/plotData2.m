% plot parameters
X2=data2(:,1)-31;
Y2=data2(:,2);
%sort
s = [X2 Y2];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot2
plot2 = plot(X2, Y2);
plot2.LineStyle = 'none';
plot2.LineWidth = 0.5;
plot2.Color = 'k';
plot2.Marker = '.';
plot2.MarkerSize = 6;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';
createFit(X2, Y2, 0.9);

% plot f
Xf=(00:0.01:65);
Yf=DG(2.5, 5, 2, 1.88, 12, 30, Xf);
plotf = plot(Xf, Yf);
plotf.LineStyle = '-';
plotf.LineWidth = 1.5;
plotf.Color = 'k';
plotf.Marker = 'none';
plotf.MarkerSize = 6;
plotf.MarkerEdgeColor = 'k';
plotf.MarkerFaceColor = 'k';

% legend
l=legend('','I(\theta), \theta_0=30deg'...
    , 'theoretical, d=5mm, a=2.5mm, N=2, lambda=1.88mm');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southwest';


% final
title('Reflection Characteristics');
xlabel('\theta°');
ylabel('I');
hold off;

