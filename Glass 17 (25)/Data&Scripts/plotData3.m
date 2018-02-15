% plot parameters
X3=data3(:,1)-47;
Y3=data3(:,2);
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
plot3.LineStyle = 'none';
plot3.LineWidth = 0.5;
plot3.Color = 'k';
plot3.Marker = '.';
plot3.MarkerSize = 6;
plot3.MarkerEdgeColor = 'k';
plot3.MarkerFaceColor = 'k';
createFit(X3, Y3, 0.9);

% plot f
Xf=(-20:0.01:100);
Yf=DG(2.5, 5, 2, 1.88, 12, 45, Xf);
plotf = plot(Xf, Yf);
plotf.LineStyle = '-';
plotf.LineWidth = 1.5;
plotf.Color = 'k';
plotf.Marker = 'none';
plotf.MarkerSize = 6;
plotf.MarkerEdgeColor = 'k';
plotf.MarkerFaceColor = 'k';

% legend
l=legend('','I(\theta), \theta_0=45deg'...
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

