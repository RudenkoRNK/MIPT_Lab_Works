collectData;

Calib(:, 4)=Calib(:,1);
Calib(:,5)=Calib(:,2);
Calib(:,2)=Calib(:,4)+Calib(:,5);
[s, ~]=size(Calib);
Calib(1,1)=Init;
for i=2:s
    Calib(i, 1)=Calib(i-1,1)*100/Calib(i, 3);
end

points(:,2)=log(unk(1,:)'+unk(2,:)');
X1=log(Calib(:,1));
Y1=log(Calib(:,2));
[xData, yData] = prepareCurveData( X1, Y1 );
ft = fittype( 'poly4' );
[fitresult, gof] = fit( xData, yData, ft );
coefs=coeffvalues(fitresult);

f=poly2sym(coefs);
g=finverse(f);

[s, ~]=size(points);
for i=1:s
    x=points(i, 2);
    points(i,1)=eval(g);
end

plotData;
plotData1;
plotData2;
plotData3;