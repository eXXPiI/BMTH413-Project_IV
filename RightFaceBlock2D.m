%% Preamble
% Program: RightFaceBlock2D.m
% Author: Jonathan Myers
% Date: February 11, 2020
% Purpose: Fold Right Face Blocks in protein sequence.
% Arguments: Coordinates of residues, residue blocks, and index.
% Loads: None.
% Calls: None.
% Returns: None.

%% Function
function coordinates = RightFaceBlock2D(coordinates,blocks,index)
if index == length(blocks)+1
    return
end

stg = blocks{1,index};
oneLocations = find(stg == '1');
spaceLength = [];
for i = 1:length(oneLocations)-1
    spaceLength(i) = oneLocations(i+1) - oneLocations(i); %#ok<AGROW>
end

if isempty(stg)
    return
end

if isempty(coordinates)
    newPosition = [0,0,1];
    coordinates = [coordinates;newPosition];
elseif coordinates(end,1:2) == [0,0] %#ok<BDSCA>
    currentPosition = coordinates(end,:);
    newPosition = [currentPosition(1)+1,currentPosition(2),1];
    coordinates = [coordinates;newPosition];
else
    currentPosition = coordinates(end,:);
    newPosition = [currentPosition(1),currentPosition(2)-1,1];
    coordinates = [coordinates;newPosition];
end

for i = 1:length(spaceLength)
    horizontalLen = (spaceLength(i)-1)/2;
    
    currentPosition = coordinates(end,:);
    for j = 1:horizontalLen
        newPosition = [currentPosition(1)+j,currentPosition(2),0];
        coordinates = [coordinates;newPosition]; %#ok<AGROW>
    end
    
    currentPosition = coordinates(end,:);
    for j = 0:horizontalLen
        newPosition = [currentPosition(1)-j,currentPosition(2)-1,0];
        coordinates = [coordinates;newPosition]; %#ok<AGROW>
    end
    
    currentPosition = coordinates(end,:);
    newPosition = [currentPosition(1),currentPosition(2)-1,1];
    coordinates = [coordinates;newPosition]; %#ok<AGROW>
end

end

% M02 End Program