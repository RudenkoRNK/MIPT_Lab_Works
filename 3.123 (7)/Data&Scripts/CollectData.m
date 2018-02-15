clear;
%open files
fileData0 = fopen('c.txt','r');
fileData1 = fopen('p8.txt','r');
fileData2 = fopen('p8b.txt','r');
fileData3 = fopen('p9nc1.txt','r');
fileData4 = fopen('p9nc2.txt','r');
fileData5 = fopen('p10nc1.txt','r');
fileData6 = fopen('p10nc2.txt','r');
fileData7 = fopen('other.txt','r');

%setting formats
format = '%f';

%read files
nC=fscanf(fileData0,format, [1 inf])';
data1=fscanf(fileData1,format, [4 inf])';
data2=fscanf(fileData2,format, [4 inf])';
data3=fscanf(fileData3,format, [2 inf])';
data4=fscanf(fileData4,format, [2 inf])';
data5=fscanf(fileData5,format, [3 inf])';
data6=fscanf(fileData6,format, [3 inf])';
data7=fscanf(fileData7,format, [1 inf])';


%common
[N, ~] = size(nC);
R = data7(1);
R1 = data7(2);
nc1=data7(3);
nc2=data7(4);

%8a
kF8a = data1(:,2);
mU8a = data1(:,3);
nC8a = zeros(N, 1);
for i = 1:N
    nC8a(i) = nC(data1(i, 1));
end
mE8a = data1(:,4);

%8b
kF8b = data2(:,2);
mU8b = data2(:,3);
nC8b = zeros(N, 1);
for i = 1:N
    nC8b(i) = nC(data2(i, 1));
end
mE8b = data2(:,4);

%91,4
kF9nc1 = data3(:,1);
mU9nc1 = data3(:,2);
kF9nc2 = data4(:,1);
mU9nc2 = data4(:,2);

%101,4
kF10nc1 = data5(:,1);
dPhiS10nc1 = data5(:,2)./data5(:,3);
dPhiSErr10nc1 = dPhiS10nc1*0.05;
kF10nc2 = data6(:,1);
dPhiS10nc2 = data6(:,2)./data6(:,3);
dPhiSErr10nc2 = dPhiS10nc2*0.05;

