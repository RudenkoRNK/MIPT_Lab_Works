[xData, yData] = prepareCurveData(peakcoords(ch, :), wavelengths );

% Set up fittype and options.
ft = fittype( 'a/x+b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.MaxFunEvals = 6000;
opts.MaxIter = 4000;
opts.StartPoint = [130000000 70];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
coefs=coeffvalues(fitresult);
a(ch)=coefs(1);
b(ch)=coefs(2);

if (plot_enable)
    % Plot fit with data.
    figure;
    hold on;
    grid on;
    h = plot( fitresult, xData, yData );
    set(h, 'LineWidth', 3);
    set(h, 'MarkerSize', 22);
    set(h, 'MarkerEdgeColor', 'k');


    l=legend(['a = ' num2str(round(a(ch)), '%7.4e\n') 'kHz*nm'],...
             ['b = ' num2str(b(ch)) 'nm']);

    xlabel('freq, kHz');
    ylabel('wavelength, nm');

    title(['Dispersion curve. Chanel ' num2str(ch)]);
    hold off;
end