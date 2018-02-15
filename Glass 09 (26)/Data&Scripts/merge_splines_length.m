if(plot_enable)
    figure;
    hold on;
    grid on;
end
for peaki=1:3
    freq_peak=peakcoords(ch, peaki);
    titletext=['Chanel ' num2str(ch) '. Peak ' num2str(peaki)];
    peak_spline_length;
end
if(plot_enable)
    %legend
    l=legend(['\lambda = ' num2str(wavelengths(1)) 'nm'],...
             ['\delta\lambda = ' num2str(dlambda(ch, 1)) 'nm'],...
             ['\lambda = ' num2str(wavelengths(2)) 'nm'],...
             ['\delta\lambda = ' num2str(dlambda(ch, 2)) 'nm'],...
             ['\lambda = ' num2str(wavelengths(3)) 'nm'],...
             ['\delta\lambda = ' num2str(dlambda(ch, 3)) 'nm']);
    l.TextColor='k';
    l.Color = 'w';
    l.Box = 'on';
    l.EdgeColor = [0.15 0.15 0.15];
    l.LineWidth = 0.5;
    l.Location ='northeast';

    % final
    title(['Normalized shifted splined spectra. Chanel ' num2str(ch)]);
    xlabel('\lambda, nm');
    ylabel('I, parrots');
    hold off;
end