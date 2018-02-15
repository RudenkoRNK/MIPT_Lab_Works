% plot parameters
X1=log(Calib(:,1));
Y1=log(Calib(:,2));
X2=points(:,1);
Y2=points(:,2);
%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure1=figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = '--';
plot1.LineWidth = 0.5;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


plot2 = plot(X2, Y2);
plot2.LineStyle = 'none';
plot2.LineWidth = 0.5;
plot2.Color = 'r';
plot2.Marker = '^';
plot2.MarkerSize = 8;
plot2.MarkerEdgeColor = 'r';
plot2.MarkerFaceColor = 'r';

% legend
l=legend('R+B on CO_2 volume', 'Undefined mixes');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southeast';
    
    
    % Create textarrow
    annotation(figure1,'textarrow',[0.395007342143906 0.546255506607929],...
        [0.775581395348837 0.774418604651163],'String',{'Mix 1'});
    
    % Create textarrow
    annotation(figure1,'textarrow',[0.334801762114537 0.446685878962536],...
        [0.631395348837209 0.630857142857143],'String',{'Mix 2'});
    
    % Create textarrow
    annotation(figure1,'textarrow',[0.759365994236311 0.757925072046109],...
        [0.717714285714286 0.899428571428571],'String',{'Breath with delay'});
    
    % Create textarrow
    annotation(figure1,'textarrow',[0.687432867883996 0.688760806916426],...
        [0.663600525624179 0.876571428571429],'String',{'Breath'});


% final
title('Calibration curve');
xlabel('log(V(CO_2)/V)');
ylabel('log(R+B)');
hold off;
