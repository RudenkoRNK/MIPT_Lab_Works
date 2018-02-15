% plot parameters
X1 = (1:nNa/2)';
d1 = dNa(1:2:end)';
d2 = dNa(2:2:end)';
Y1 = ((d1.^2+d2.^2)/8/fNa^2);
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
plot1.LineWidth = 0.8;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% fit1
fit1=fit(X1, Y1,'poly1');
fit1Plot=plot(fit1);
fit1Coefs=coeffvalues(fit1);
fit1Plot.LineStyle = '--';
fit1Plot.LineWidth = 0.9;
fit1Plot.LineJoin = 'round';

% legend
l=legend('(\theta_{i1}^{2}+\theta_{i2}^{2})/2',...
        strcat('Average \lambda = ',num2str(fit1Coefs(1)*interfBase*(10^6), '%5.2f'), 'nm')');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title({'Dependence of \theta_{i1}^{2}+\theta_{i2}^{2} on circle pairs number';...
            'Natrium yellow lines'});
xlabel('circle pair number divided by L');
ylabel('(\theta_{i1}^{2}+\theta_{i2}^{2})/2');
hold off;
