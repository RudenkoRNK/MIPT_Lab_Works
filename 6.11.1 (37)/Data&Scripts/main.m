%open files
data=DataContainer;
data.parsefiles();

T0=26;    % celsius
R1=220;   % Ohm
R3=560;   % Ohm
V0=0.11;  % mV
h=4.1;    % mm
w=4.5;    % mm
l=40;     % mm
S=h*w;    % mm^2

R2=data.gc('data', 'R_2');
sigma=l*R1/S/R3./R2;
data.addColumn(sigma, 'data', '\sigma,(Ohm*m)^{-1}');
sigmaEpsErr=sqrt((0.5/l)^2+(0.05/h)^2+(0.05/w)^2+(0.5/R1)^2+(0.5/R3)^2+(0.005./R2).^2);
data.addErrorColumn(sigmaEpsErr.*sigma, 'data', 'sigma');
T=T0+TbyV(data.data{data.getiDatum('Copper')}, data.gc('data', 'V$')-V0);
TErr=sqrt((0.005*25)^2+(0.5)^2);
data.addColumn(T, 'data', 'Temperature,°C', TErr);
lnsigma=log(sigma);
Tinv=1./(T+273);
data.addColumn(lnsigma, 'data', 'ln(\sigma)', sigmaEpsErr);
data.addColumn(Tinv, 'data', '1/T', TErr./((T+273).^2));

fit=plotseries(data, {'1\/T$'},...
                     {'ln\(\\sigma\)$'}, ...
                     {'data'});
                 
             
Table=table(data.colNames{2}', data.colUnits{2}', data.data{2}');
%writetable(Table, 'rst.xlsx')