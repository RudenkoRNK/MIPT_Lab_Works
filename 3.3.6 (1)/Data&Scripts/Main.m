%Data collection
fileCalib = fopen('calibration.txt','r');
fileCorb = fopen('Corbino disk.txt','r');
filePlAcross = fopen('plate across.txt','r');
filePlAlong = fopen('plate along.txt','r');
formatSpec = '%f %f';
calib=fscanf(fileCalib,formatSpec,[2 Inf])';
I=calib(:,1);
B=calib(:,2);
UCorb=fscanf(fileCorb,'%f')';
UPlAcross=fscanf(filePlAcross,'%f')';
UPlAlong=fscanf(filePlAlong,'%f')';
I0Corb=23.7;
I0Pl=10.0;
IErr=0.05;
UErr=0.005;
[sizeB, t]=size(B);
BErr=zeros(1,sizeB)+0.5;


%I(B)
errorbar(I, B,BErr,'.');
hold on;
grid on;
title('B(Im)');
ylabel('B, mT');
xlabel('Im, A');
hold off;
%
RCorb=UCorb/I0Corb;
RPlAcr=UPlAcross/I0Pl;
RPlAlg=UPlAlong/I0Pl;
BB=(B.*B);
figure;
plot(BB, RCorb, '.','color','k');
fitCorb=fit(BB, RCorb','poly1');
fitPlAcr=fit(BB, RPlAcr','poly1');
fitPlAlg=fit(BB, RPlAlg','poly1');
hold on;
plot(B.*B, RPlAcr, '.','color','k');
plot(B.*B, RPlAlg, '.','color','k');
plot(fitCorb,'--');
plot(fitPlAcr,':');
plot(fitPlAlg,'-.');
grid on;
title('R(B)');
ylabel('R, Ohm');
xlabel('B^2, mT^2');
