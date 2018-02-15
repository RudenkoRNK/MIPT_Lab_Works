%sort
X1=freq;
Y1=spe(:, ch);
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% plot1
if(plot_enable)
    % make new space
    figure;
    hold on;
    grid on;
    plot1 = plot(X1, Y1);
    plot1.LineStyle = 'none';
    plot1.LineWidth = 0.5;
    plot1.Color = 'k';
    plot1.Marker = '.';
    plot1.MarkerSize = 8;
    plot1.MarkerEdgeColor = 'k';
    plot1.MarkerFaceColor = 'k';
    % final
    title(['Spectrum.'...
                 ' Channel ' num2str(ch)]);
    xlabel('f, kHz');
    ylabel('I, parrots');
    hold off;
end