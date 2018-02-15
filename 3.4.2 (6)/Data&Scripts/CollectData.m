clear;
%open files
fileDataA = fopen('tau.txt','r');
fileDataB = fopen('T, cels.txt','r');
fileDataC = fopen('du.txt','r');
fileDataD = fopen('other.txt','r');

%setting formats
format = '%f';

%read files
tau=fscanf(fileDataA,format, [1 inf])';
TC=fscanf(fileDataB,format, [1 inf])';
du=fscanf(fileDataC,format, [1 inf])';
other=fscanf(fileDataD,format, [1 inf])';

%read X and Y
tau0 = other(2);
k = other(1);
TK = TC + du*k+273.15;

%setting errors
[t, ~] = size (tau);
Verr = zeros(t,1)+1;