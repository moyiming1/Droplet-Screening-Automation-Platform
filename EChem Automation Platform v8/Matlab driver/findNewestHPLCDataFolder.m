function dataFolder = findNewestHPLCDataFolder(HPLCPath)
%% version history
% v0.1 created by Yiming Mo 01/22/2019
% find the newest HPLC data folder in ChemStation folder

%%
dirc = dir(HPLCPath);

%delete the first two lines, '.', '..'
dirc = dirc(3:end);

k = 1;
%filter out non-folder entries
for i = 1:length(dirc)
    if isdir(strcat(dirc(i).folder,'\',dirc(i).name))
        dircFolder(k) = dirc(i);
        k = k+1;
    end
end

% find the newest generated HPLC data folder
[~,index] = max([dircFolder(:).datenum]);

dataFolder = strcat(dirc(index).folder,'\',dirc(index).name);
end
