%table
I08a = 1e-3*mE8a./R1;
I08b = 1e-3*mE8b./R1;
om08a = (2*pi*kF8a*1000).^2;
L8a = 1./((nC8a*(1e-9)).*om08a);
L8b = 1000./(4*pi^2*(nC8b.*kF8b.*kF8b));
Rho8a = sqrt(1e9*L8a./nC8a);
Rho8b = sqrt(1e9*L8b./nC8b);
ZRes8a = 1e-3*mU8a./I08a;
ZRes8b = 1e-3*mU8b./I08b;
Q8a = ZRes8a./Rho8a;
Q8b = ZRes8b./Rho8b;
RSgm8a = ZRes8a./(Q8a.*Q8a);
RSgm8b = ZRes8b./(Q8b.*Q8b);
RS8a = 1e-3*Rho8a;
RS8b = 1e-3*Rho8b;
RL8a = RSgm8a - R - RS8a;
RL8b = RSgm8b - R - RS8b;

%stats
LAv8a = mean(L8a);
LAv8b = mean(L8b);
deltaL8a = std(L8a)/sqrt(N);
deltaL8b = std(L8b)/sqrt(N);
RLAv8a = mean(RL8a);
RLAv8b = mean(RL8b);
deltaRLAv8a = std(RL8a)/sqrt(N);
deltaRLAv8b = std(RL8b)/sqrt(N);
