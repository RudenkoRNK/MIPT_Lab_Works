% plot parameters
X1=V;
Y1=I;

%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure1 = figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = '--';
plot1.LineWidth = 0.5;
plot1.Marker = '.';
plot1.MarkerSize = 6;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';
annotation(figure1,'textarrow',[0.319742489270386 0.412017167381974],...
        [0.266787658802178 0.11070780399274],'String',{'blackout voltage'});
annotation(figure1,'textarrow',[0.393776824034335 0.487124463519314],...
        [0.379310344827586 0.226860254083485],'String',{'starting voltage'});

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
title('Stabilivolt VI characteristic');
xlabel('V, V');
ylabel('I, A');
hold off;
