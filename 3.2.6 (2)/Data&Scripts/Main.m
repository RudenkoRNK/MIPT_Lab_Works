%Data collection
fileTheta= fopen('theta.txt','r');
fileXOnR = fopen('xOnR.txt','r');
fileOther = fopen('other.txt','r');
fileBall = fopen('ballistic.txt','r');
formatTheta = '%f';
formatOther = '%*s%f';
formatXOnR = '%f %f';
formatBallistic = '%f %f';
sizeA=8;
sizeB=11;
thetaF=fscanf(fileTheta,formatTheta, [sizeA sizeB])';
other=fscanf(fileOther,formatOther)';
xOnR=fscanf(fileXOnR,formatXOnR, [2 inf])';
ballistic=fscanf(fileBall,formatBallistic, [2 inf])';
R0=other(1);
U0=other(2);
xFactor=other(3);
Rcr=other(5);

%I(x)
I=U0*thetaF(1,2)./(xOnR(:,2)+R0);
[Icount, t]=size(xOnR);
X=xOnR(:,1)*xFactor;
xErr=(zeros(1,Icount)+other(4))*xFactor;
errorbar(I, X, xErr,'.',...
                'color','k',...
                'MarkerSize',10);
hold on;
grid on;
fitIX=fit(I, X,'poly1');
fitXI=fit(X, I,'poly1');
fitPlot=plot(fitIX);
set(fitPlot,'color', 'k', 'LineWidth',0.8);
coefs=coeffvalues(fitXI);
l=legend('I(x)',strcat('linear fit=',num2str(coefs(1), '%e')) );
l.Location ='best';
title('I(x)');
view([90 -90])
xlabel('I, A');
ylabel('x, m');
hold off;

% theta
figure;
theta = thetaF(:, 4:sizeA);
for i=1:sizeA-4
    theta(:, i) = theta(:, i)./theta(:, i+1);
end
thetaAv=mean(theta(:, 1:sizeA-4)');
thetaAv=log(thetaAv);
xData=1./(thetaAv.*thetaAv);
yData=(R0+thetaF(2:sizeB,1));
yData=yData.*yData;
xData=xData(2:sizeB);
plot(xData,yData,'.',...
            'color','k',...
            'MarkerSize',10);
hold on;
fitTheta=fit(xData', yData,'poly1');
fitPlot2=plot(fitTheta);
set(fitPlot2,'color', 'k', 'LineWidth',0.8);
coefs=coeffvalues(fitTheta);
l2=legend('R(theta)',strcat('linear fit=',num2str(coefs(1), '%e')) );
l2.Location ='best';
title('R(theta)');
ylabel('(R+R0)^2, Ohm^2');
xlabel('1/Theta^2');
grid on;
hold off;


% ballistic
figure;

xData2=1./(R0+ballistic(:,2));
yData2=ballistic(:,1)*xFactor;
[s,t]=size(yData2);
xErr=(zeros(1,s)+other(4))*xFactor;
errorbar(xData2,yData2,xErr,'.',...
            'color','k',...
            'MarkerSize',10);
hold on;
fitRcr=fit(xData2, yData2,'poly1');
fitPlot3=plot(fitRcr);
set(fitPlot3,'color', 'k', 'LineWidth',0.8);
coefs=coeffvalues(fitRcr);
l3=legend('L(theta)',strcat('linear fit=',num2str(coefs(1), '%e')) );
l3.Location ='best';
title('L(theta)');
ylabel('l max, m');
xlabel('1/(R+R0)');
grid on;
hold off;

