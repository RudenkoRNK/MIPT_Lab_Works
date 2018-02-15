minind=round((freq_peak-freqmin-300)/freqstep)+2;
maxind=round((freq_peak-freqmin+300)/freqstep)-1;

smooth=0.9999;
X=a(ch)./freq(minind:maxind)-a(ch)/freq_peak;
Y=spe(minind:maxind, ch);
Y=Y/peakvalues(ch, peaki);
X=[X; 0; 0; 0]; Y=[Y; 1; 1; 1];
[xData, yData] = prepareCurveData( X, Y );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
coefs=coeffvalues(fitresult);
dlambda(ch, peaki)=2*sqrt(log(2))*coefs(3);
err=confint(fitresult,0.95);
dlambdaerr(ch, peaki, 1)=err(1, 3);
dlambdaerr(ch, peaki, 2)=err(2, 3);

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

