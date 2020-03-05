%% Preamble
% Program: RightSeparator2D.m
% Author: Jonathan Myers
% Date: February 11, 2020
% Purpose: Fold Right Median Separator/Block/Separator chunk in protein sequence.
% Arguments: Coordinates of residues, residue separators, and index.
% Loads: None.
% Calls: None.
% Returns: None.

%% Function
function coordinates = RightSeparator2D(coordinates,separators,blocks,index)
if index >= length(separators)
    return
end

stg = strcat(separators{1,index},blocks{1,index+1},separators{1,index+1});
len = strlength(stg);
horizontalLen = (len-1)/2;

currentPosition = coordinates(end,:);
for i = 1:horizontalLen
    newPosition = [currentPosition(1)+i,currentPosition(2),...
        str2double(stg(i))];
    coordinates = [coordinates;newPosition]; %#ok<AGROW>
end

currentPosition = coordinates(end,:);
for i = 0:horizontalLen
    newPosition = [currentPosition(1)-i,currentPosition(2)-1,...
        str2double(stg(horizontalLen+1+i))];
    coordinates = [coordinates;newPosition]; %#ok<AGROW>
end
end

% M02 End Program