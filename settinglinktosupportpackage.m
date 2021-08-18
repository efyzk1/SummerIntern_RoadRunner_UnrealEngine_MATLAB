src_root = fullfile(matlabshared.supportpkg.getSupportPackageRoot, ...
    "toolbox", "shared", "sim3dprojects", "spkg");

 

%% STEP2

% Specify the location of the Unreal Engine installation.

ueInstFolder = "D:\Downloads\Epic Games\UE_4.23";

 

 

%% STEP3

% Copy the MathWorksSimulation plugin to the Unreal Engine plugin folder.

mwPluginName = "MathWorksSimulation";

mwPluginFolder = fullfile(src_root, "plugins");

uePluginFolder = fullfile(ueInstFolder, "Engine", "Plugins");

uePluginDst = fullfile(uePluginFolder, "Marketplace", "MathWorks");

 

 

cd(uePluginFolder)

foundPlugins = dir("**/" + mwPluginName + ".uplugin");

 

if ~isempty(foundPlugins)

    numPlugins = size(foundPlugins, 1);

    msg2 = cell(1, numPlugins);

    pluginCell = struct2cell(foundPlugins);

 

    msg1 = "Plugin(s) already exist here:" + newline + newline;

    for n = 1:numPlugins

        msg2{n} = "    " + pluginCell{2,n} + newline;

    end

    msg3 = newline + "Please remove plugin folder(s) and try again.";

    msg  = msg1 + msg2 + msg3;

    warning(msg);

else

    copyfile(fullfile(mwPluginFolder, 'mw_simulation', 'MathWorksSimulation'), uePluginDst);

    disp("Successfully copied MathWorksSimulation plugin to UE4 engine plugins!")

end