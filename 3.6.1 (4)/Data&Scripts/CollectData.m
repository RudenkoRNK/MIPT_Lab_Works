%open files
fileDataA = fopen('Data A.txt','r');
fileDataB = fopen('Data B.txt','r');
fileDataC = fopen('Data C.txt','r');

%setting formats
format = '%f';

%read files
dA=fscanf(fileDataA,format, [2 inf])';
dB=fscanf(fileDataB,format, [2 inf])';
dC=fscanf(fileDataC,format, [2 inf])';

%read X and Y
tauA=dA(:,1)*(1e-6);
nuA=dA(:,2)*1000;

nuB=dB(:,1)*1000;
fB=dB(:,2)*1000;

bigAC=dC(:,1);
littleAC=dC(:,2);

%setting errors
[t, ~] = size (tauA);
nuAerr = zeros(t,1)+130;
[t, ~] = size (nuB);
nuBerr = zeros(t,1)+100;