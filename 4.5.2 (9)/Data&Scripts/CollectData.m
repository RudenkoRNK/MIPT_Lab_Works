clear;
%open files
fileData1 = fopen('data.txt','r');
fileData2 = fopen('data2.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [5 inf])';
data2=fscanf(fileData2,format, [5 inf])';


%common
Y1 = (data1(:, 5) - data1(:, 4)).*(data1(:, 3) + data1(:, 2))...
   ./(data1(:, 5) + data1(:, 4))/2./sqrt(data1(:, 3).* data1(:, 2));
X1 = data1(:, 1)/360*2*pi;

Y4 = (data2(:, 5) - data2(:, 4)).*(data2(:, 3) + data2(:, 2))...
   ./(data2(:, 5) + data2(:, 4))/2./sqrt(data2(:, 3).* data2(:, 2));
X4 = data2(:, 1);

xleft = min(X1);
xright = max(X1);
n = 1000;
X2 = (xleft:(xright-xleft)/n:xright);
Y2 = cos(X2);

X3 = X2;
Y3 = cos(X3).^2;