%sort
X1=wavelengths';
Y1=(wavelengths./dlambda(ch,:))';
Yerr=abs(((wavelengths./dlambdaerr(ch,:, 1))-(wavelengths./dlambdaerr(ch,:,2))))/2';

% plot1
if(plot_enable)
    % make new space
    hold on;
    grid on;
    plot1 = errorbar(X1, Y1, Yerr);
    plot1.LineStyle = 'none';
    plot1.LineWidth = 0.5;
    plot1.Color = 'k';
    plot1.Marker = marker_styles{ch};
    plot1.MarkerSize = marker_sizes{ch};
    plot1.MarkerEdgeColor = 'k';
    plot1.MarkerFaceColor = 'k';

    % fit1
    fit1=fit(X1, Y1,'poly1');
    fit1Plot=plot(fit1);
    fit1Coefs=coeffvalues(fit1);
    fit1Plot.LineStyle = line_styles{ch};
    fit1Plot.LineWidth = 3.0;
    fit1Plot.LineJoin = 'round';

    % final
    title(['Spectral resolution']);
    xlabel('\lambda, nm');
    ylabel('R');
    hold off;
end