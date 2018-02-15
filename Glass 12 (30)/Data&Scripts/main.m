%open files
data=Data;
data=data.parsefiles();

i=data.indexByName('Temperature dependence 2');
s=3900;
e=max(size(data.data{i}))-2400;
shift=12.1;
newdat=[data.data{i}(s:e,1),...
        data.data{i}(s:e,2)+shift,...
        data.data{i}(s:e,3)];
T=(300:0.1:380)';
Tc=349.6;
A=0.05*(abs(Tc-T)).^(0.5)+0.24;
L=find(T>Tc);
for i=1:max(size(L))
    A(L(i))=-A(L(i))+0.5;
end
data=data.add(newdat, 'Extrapolated', {'a' 'b' 'c'});
data=data.add([T A], 'Analytical', {'a' 'b'}, 3);
plot_series(data, [2 2 1], [1 1 2], 3);