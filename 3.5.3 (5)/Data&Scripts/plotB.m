% plot parameters
X1=V-5100*I;
Y1=I;

%sort
s = [X1 Y1];
s = sortrows(s,2);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure1 = figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = 'none';
plot1.LineWidth = 0.5;
plot1.Marker = '.';
plot1.MarkerSize = 8;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% legend
l=legend('I(V)'...
        );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Diode VI characteristic');
xlabel('V, V');
ylabel('I, A');
hold off;
