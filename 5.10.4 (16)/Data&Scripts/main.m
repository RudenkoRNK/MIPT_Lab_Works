collectData;
[fitresult, gof]=createFit(X1, Y1);
i=2;
x0=-4;
Y2(1) = 0;
Y1(1)= fitresult(-4);
X(1)=-4;
for x = -4:0.001:12
    X(i)=x;
    Y2(i)=Y2(i-1)+fitresult(x)*(x-x0);
    Y1(i)=fitresult(x);
    i=i+1;
    x0=x;
end
figure;
hold on;
a=plot(X, Y2);
b=plot(X, Y1);
axis off;
a.LineWidth=6;
b.LineWidth=6;