%open files
data=DataContainer;
data.parsefiles();

data.addErrorColumn(0.05, 1, "V\_R");
data.addErrorColumn(0.02, 1, "V\_\{touch\+\}");
data.addErrorColumn(0.02, 1, "V\_\{touch\-\}");

plotseries(data, {"V\_R$" "V\_R$"}, {"\+\}$" "\-\}$"}, {1 1}, {1 2}, 'gridSize', [1 2]);