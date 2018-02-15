% plot parameters
X1=data1(:,1);
Y1=data1(:,2);
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
plot1.LineStyle = 'none';
plot1.LineWidth = 0.5;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 6;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';
createFit(X1, Y1, 0.8);

% plot f
Xf=(-90:0.01:90);
Yf=DG(2.5, 5, 2, 1.88, 5, 0, Xf);
plotf = plot(Xf, Yf);
plotf.LineStyle = '-';
plotf.LineWidth = 1.5;
plotf.Color = 'k';
plotf.Marker = 'none';
plotf.MarkerSize = 6;
plotf.MarkerEdgeColor = 'k';
plotf.MarkerFaceColor = 'k';

% legend
l=legend('','I(\theta), \theta_0=0deg'...
    , 'theoretical, d=5mm, a=2.5mm, N=2, lambda=1.88mm');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southwest';


% final
title('Transparency Characteristics');
xlabel('\theta°');
ylabel('I');
hold off;
