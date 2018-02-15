%open files
dc=DataContainer;
dc.parsefiles();

dc.markErrorColumn(1, "Voltage$", "Voltage Error");
dc.markErrorColumn(1, "f$", "f Error");
dc.markErrorColumn(1, "f_0$", "f Error");

c=1000/40; %K/mV
V0=-0.11;  %mV
T0=27;    %cels


icol=dc.addColumn((-dc.gc(1,"Voltage$")+V0)*c+T0, 1, "T,°C");
dTErr=abs(dc.gc(1,"T$").*(dc.gc(1, "Voltage Error$")./dc.gc(1,"Voltage$")))+0.5;
dc.addErrorColumn(dTErr, 1, icol, "T Error,K");

f=dc.gc(1,"f$");
df=dc.gc(1,"f Error");
f0=dc.gc(1,"f_0$");
f2=f0.^2-f.^2;
f2e=abs((2*f.*df)./(f.^2 - f0.^2)) + abs((f.^2.*(abs(2*f.*df) + abs(2*f0.*df)))./(f.^2 - f0.^2).^2);
icol=dc.addColumn(f.^2./f2,1,"f^2/(f_0^2-f^2) Susceptibility,s^2");
dc.addErrorColumn(f2e, 1, icol, "f^2/(f_0^2-f^2) Susceptibility Error,s^2");
plotseries(dc, 1, "T$", "Susceptibility$");

