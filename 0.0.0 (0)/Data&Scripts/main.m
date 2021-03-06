%open files
data=DataContainer;
data.parsefiles();

data.markErrorColumn('^data$', 'len$', 'lenErr');
data.markErrorColumn('^data$', 'angle$', 'angleErr');

%  plotseries(data);
% plotseries(data, 'mixWithinDatum', false);
% plotseries(data, {"len$", 2, "angle$"},...
%                  {'angle$', 1, "len$"},...
%                  {'3', '2', '^data$'},...
%                  [1,2,2], 'gridSize',[1,2], 'iDataY', [1 2 2], 'mixWithinDatum', false);


plotseries(data, {"len$", 2, "angle$"},...
                 {'angle$', 1, 1},...
                 {3, '2', '^data$'},...
                 [1,2,2], 'gridSize', [1,2]);