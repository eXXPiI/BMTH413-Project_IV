%% Preamble
% Program: Visualizer.m
% Author: Jonathan Myers
% Date: February 6, 2020
% Purpose: Plot fold.
% Arguments: Sequence character vector of '1' or '0', residue coordinates.
% Loads: None.
% Calls: None.
% Returns: None.

%% Start
function Visualizer(coordinates)
close all
hold on
axis off
for elementNum = 1:length(coordinates(:,3))
    if coordinates(elementNum,3) == 1
        scatter(coordinates(elementNum,1),coordinates(elementNum,2),75,'filled','rs');
    else
        scatter(coordinates(elementNum,1),coordinates(elementNum,2),50,'filled','bo');
    end
end
plot(coordinates(:,1),coordinates(:,2),'k');
end
% M02 End Program
