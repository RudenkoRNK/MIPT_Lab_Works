collect_data;

xwave=false;
plot_enable=false;
for ch=1:2
    plot_spectrum;
end

plot_enable=false;
for ch=1:2
    for peaki=1:3
        freq_peak=peakcoords(ch, peaki);
        titletext=['Chanel ' num2str(ch) '. Peak ' num2str(peaki)];
        peak_search;
    end
end

plot_enable=true;
line_styles={'--', ':', '-.'};
marker_styles={'.', '^', 'o'};
marker_sizes={20, 8, 8};

for ch=1:2
    merge_splines_freq;
end

plot_enable=false;
a=[0 0];
b=[0 0];
for ch=1:2
    dispersion_curve;
end

plot_enable=true;
dlambda=zeros(2, 3);
dlambdaerr=zeros(2, 3,2);
for ch=1:2
    merge_splines_length;
end

plot_enable=false;
if(plot_enable)
    figure;
end
for ch=1:2
    plot_spectral_resolution;
end

if(plot_enable)
    l=legend(['chanel 1'],...
             ['chanel 1'],...
             ['chanel 2'],...
             ['chanel 2']);
end