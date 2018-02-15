clear;
%open files
fileData1 = fopen('Natrium.txt','r');
fileData2 = fopen('ArgentumRed.txt','r');
fileData3 = fopen('ArgentumYellow.txt','r');
fileData4 = fopen('ArgentumGreen.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [2 inf])';
data2=fscanf(fileData2,format, [2 inf])';
data3=fscanf(fileData3,format, [2 inf])';
data4=fscanf(fileData4,format, [2 inf])';

fNa = 94;
fAg = 110;
laAgGr = 546.1/10^6;

%common
nNaT = data1(:, 1);
dNaT = data1(:,2);
nNa = max(nNaT);
dNa = zeros(1, nNa);
for i=1:nNa
    [~, ind1] = ismember(i, nNaT);
    [~, ind2] = ismember(-1, nNaT);
    dNa(i) = dNaT(ind1) - dNaT(ind2);
end

nAgRedT = data2(:, 1);
dAgRedT = data2(:,2);
nAgRed = max(nAgRedT);
dAgRed = zeros(1, nAgRed);
for i=1:nAgRed
    [~, ind1] = ismember(i, nAgRedT);
    [~, ind2] = ismember(-1, nAgRedT);
    dAgRed(i) = dAgRedT(ind1) - dAgRedT(ind2);
end

nAgYelT = data3(:, 1);
dAgYelT = data3(:,2);
nAgYel = max(nAgYelT);
dAgYel = zeros(1, nAgYel);
for i=1:nAgYel
    [~, ind1] = ismember(i, nAgYelT);
    [~, ind2] = ismember(-1, nAgYelT);
    dAgYel(i) = dAgYelT(ind1) - dAgYelT(ind2);
end

nAgGrT = data4(:, 1);
dAgGrT = data4(:,2);
nAgGr = max(nAgGrT);
dAgGr = zeros(1, nAgGr);
for i=1:nAgGr
    [~, ind1] = ismember(i, nAgGrT);
    [~, ind2] = ismember(-1, nAgGrT);
    dAgGr(i) = dAgGrT(ind1) - dAgGrT(ind2);
end

