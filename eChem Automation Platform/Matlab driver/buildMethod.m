function buildMethod(reagentLoc,reagentVol,washLoc,mixLoc,methodPath,matlabPath)
%% version history
% created by Anirudh Nambiar v0.1 10/2018
% modified by Yiming Mo v0.2 01/2019

%%
%reagentLoc: the vial location of reagent, row vector
%reagentVol: the volume (uL) to take for each reagent, row vector
%washLoc: wash solution vial location
%mixLoc:  mixing vial location
%methodPath: Agilent ChemStation method folder path, provided by LabView

%% add path
cd(matlabPath);

fid = fopen('C:\Users\Optix\Desktop\log.txt','wt');
fprintf(fid, matlabPath);
fclose(fid);
%% Default values
drawSpeed = 90;  % [uL/min]
ejectSpeed = 90; % [uL/min]
mixSpeed = 90;   % [uL/min], speed at which air is drawn and ejected while mixing
washCycles = 1;  % number of times needle is washed between draws
mixCycles = 3;   % number of times air is drawn and ejected to mix sample
mixVol = 25; % [uL] mix volume in the mixing vial

% washLoc = 99; % wash solution location
% mixLoc = 100; % mixing vial location

numReagents = length(reagentLoc); % number of reagents

%% Create method files

methodXml = fileread('Template\Empty template.xml');  % read method template file
volumes = reagentVol;      % get volumes for method

% ------------- ADD ACTIONS -------------

% These actions are required for ALL methods
methodXml = insertDrawAir(methodXml,20,drawSpeed);
methodXml = insertEjectSeat(methodXml,20,ejectSpeed);
methodXml = insertDrawAir(methodXml,20,drawSpeed);

% Sample prep is different from method to method
for j = 1:numReagents
    if volumes(j) > 0 % draw only if volume is nonzero
        methodXml = insertDrawVial(methodXml,volumes(j),reagentLoc(j),drawSpeed);
        methodXml = insertWash(methodXml,washLoc,washCycles);
    end   
end

% These actions are required for ALL methods
methodXml = insertDrawAir(methodXml,10,drawSpeed);
methodXml = insertMix(methodXml,mixVol,mixLoc,mixSpeed,mixCycles);
methodXml = insertMoveNeedleToSeat(methodXml);

% Create method file in method folder
directoryName = strcat(methodPath,'\AgilentSamplerDriver1.RapidControl.PretreatXML.xml');
fid = fopen(directoryName,'wt');
fprintf(fid,methodXml);
fclose(fid);


end
