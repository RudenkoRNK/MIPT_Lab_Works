if(plot_enable)
    figure;
    hold on;
    grid on;
end
for peaki=1:3
    freq_peak=peakcoords(ch, peaki);
    titletext=['Chanel ' num2str(ch) '. Peak ' num2str(peaki)];
    peak_spline_freq;
end
if(plot_enable)
    %legend
    l=legend([num2str(wavelengths(1)) 'nm'],...
             [num2str(round(peakcoords(ch, 1))) 'kHz'],...
             [num2str(wavelengths(2)) 'nm'],...
             [num2str(round(peakcoords(ch, 2))) 'kHz'],...
             [num2str(wavelengths(3)) 'nm'],...
             [num2str(round(peakcoords(ch, 3))) 'kHz']);
    l.TextColor='k';
    l.Color = 'w';
    l.Box = 'on';
    l.EdgeColor = [0.15 0.15 0.15];
    l.LineWidth = 0.5;
    l.Location ='northeast';

    % final
    title(['Normalized shifted splined spectra. Chanel ' num2str(ch)]);
    xlabel('f, kHz');
    ylabel('I, parrots');
    hold off;
end