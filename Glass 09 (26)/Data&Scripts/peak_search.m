minind=round((freq_peak-freqmin-300)/freqstep)+2;
maxind=round((freq_peak-freqmin+300)/freqstep)-1;
X=freq(minind:maxind);
Y=spe(minind:maxind, ch);
[xData, yData] = prepareCurveData( X, Y );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
coefs=coeffvalues(fitresult);
peakcoords(ch, peaki)=coefs(2);
peakvalues(ch, peaki)=coefs(1);

if(plot_enable)
    figure;
    hold on;
    grid on;
    h = plot( fitresult, xData, yData );
    set(h, 'LineWidth', 3);
    set(h, 'MarkerSize', 12);
    set(h, 'MarkerEdgeColor', 'k');
    plot(X(1), Y(1));
    plot(X(1), Y(1));
    plot(X(1), Y(1));

    %legend
    l=legend('data',...
            ['peak fit = ' num2str(round(peakcoords(ch, peaki))) 'kHz'],...
            ['wavelength = ' num2str(wavelengths(peaki)) 'nm'],...
            ['2\sigma = ' num2str(coefs(3)) 'kHz'], ...
            ['FWHM = ' num2str(sqrt(2*log(2))*coefs(3)) 'kHz']);
    l.TextColor='k';
    l.Color = 'w';
    l.Box = 'on';
    l.EdgeColor = [0.15 0.15 0.15];
    l.LineWidth = 0.5;
    l.Location ='northeast';

    % final
    title(titletext);
    xlabel('f, kHz');
    ylabel('I, parrots');
    hold off;
end