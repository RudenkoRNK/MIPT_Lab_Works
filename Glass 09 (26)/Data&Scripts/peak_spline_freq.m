minind=round((freq_peak-freqmin-300)/freqstep)+2;
maxind=round((freq_peak-freqmin+300)/freqstep)-1;

smooth=0.026;
X=freq(minind:maxind)-peakcoords(ch, peaki);
Y=spe(minind:maxind, ch);
Y=Y/peakvalues(ch, peaki);
X=[X; 0; 0; 0]; Y=[Y; 1; 1; 1];
[xData, yData] = prepareCurveData( X, Y );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam =smooth;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

if(plot_enable)
    h = plot( fitresult, xData, yData );
    set(h, 'LineWidth', 2);
    set(h, 'Marker', 'none');
    set(h, {'LineStyle'}, {'none', line_styles{peaki}}');
end
