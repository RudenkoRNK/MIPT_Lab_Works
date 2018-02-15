clear;

%open files
fileDataA = fopen('VAC.txt','r');

%setting formats
format = '%f';

%read files
dA=fscanf(fileDataA,format, [2 inf])';

%read X and Y
V=dA(:,1);
I=dA(:,2)/1000;

%setting errors
[t, ~] = size (V);
Verr = zeros(t,1)+1;