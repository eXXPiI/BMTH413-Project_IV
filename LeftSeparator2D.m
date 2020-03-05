%% Preamble
% Program: LeftSeparator2D.m
% Author: Jonathan Myers
% Date: February 11, 2020
% Purpose: Fold Left Median Separator/Block/Separator chunk in protein sequence.
% Arguments: Coordinates of residues, residue separators, and index.
% Loads: None.
% Calls: None.
% Returns: None.

%% Function
function coordinates = LeftSeparator2D(coordinates,separators,blocks,index)
if index <= 1
    return
end

stg = strcat(reverse(separators{1,index}),reverse(blocks{1,index}),...
    reverse(separators{1,index-1}));
len = strlength(stg);
horizontalLen = (len-1)/2;

currentPosition = coordinates(1,:);
for i = 1:horizontalLen
    newPosition = [currentPosition(1)-i,currentPosition(2),...
        str2double(stg(i))];
    coordinates = [newPosition;coordinates]; %#ok<AGROW>
end

currentPosition = coordinates(1,:);
for i = 0:horizontalLen
    newPosition = [currentPosition(1)+i,currentPosition(2)-1,...
        str2double(stg(horizontalLen+1+i))];
    coordinates = [newPosition;coordinates]; %#ok<AGROW>
end
end

% M02 End Program