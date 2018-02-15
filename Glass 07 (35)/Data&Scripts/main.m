%open files
data=DataContainer;
data.parsefiles();

C=600E-6;
Energy=((data.getcol(1, 'Capacitor')*1000).^2)*C/2;
data.addColumn(Energy,1,'Pumping_energy,J');

tmax=max(data.getcol(1,'Peak time'));
tpum=1000;


syms DN(t, t3)
DN(t, t3) = ((t3*tpum).^2)./(tpum^2+pi^2*(t3.^2)).*(...
    sin(pi*t/tpum)./t3...
    -pi*cos(pi*t/tpum)/tpum...
    +pi*exp(-pi*t./t3)/tpum);
dDN=diff(DN, t);
t3=(0.1:2:1000)';
t=(0.000001:2:1000)';
data.addDatum([t3 double(dDN(tmax, t3))], 'Population derivate',...
    ["lifetime,\muS" "derivate,n"]);

plotseries(data, {1, 1},...
                 {"Out energy", "Peak time"},...
                 {"Pumping energy", "Pumping energy"},...
                 [1,2], 'gridSize', [1,2]);
plotPopulationDer(data,"Population");