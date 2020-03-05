%% Preamble
% Program: LeftFaceBlock2D.m
% Author: Jonathan Myers
% Date: February 11, 2020
% Purpose: Fold Left Face Blocks in protein sequence.
% Arguments: Coordinates of residues, residue blocks, and index.
% Loads: None.
% Calls: None.
% Returns: None.

%% Function
function coordinates = LeftFaceBlock2D(coordinates,blocks,index)
if index == 0
    return
end

stg = reverse(blocks{1,index});
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
    coordinates = [newPosition;coordinates];
% elseif coordinates(1,1:2) == [0,0] %#ok<BDSCA>
%     currentPosition = coordinates(1,:);
%     newPosition = [currentPosition(1)-1,currentPosition(2),1];
%     coordinates = [newPosition;coordinates];
else
    currentPosition = coordinates(1,:);
    newPosition = [currentPosition(1),currentPosition(2)-1,1];
    coordinates = [newPosition;coordinates];
end

for i = 1:length(spaceLength)
    horizontalLen = (spaceLength(i)-1)/2;
    
    currentPosition = coordinates(1,:);
    for j = 1:horizontalLen
        newPosition = [currentPosition(1)-j,currentPosition(2),0];
        coordinates = [newPosition;coordinates]; %#ok<AGROW>
    end
    
    currentPosition = coordinates(1,:);
    for j = 0:horizontalLen
        newPosition = [currentPosition(1)+j,currentPosition(2)-1,0];
        coordinates = [newPosition;coordinates]; %#ok<AGROW>
    end
    
    currentPosition = coordinates(1,:);
    newPosition = [currentPosition(1),currentPosition(2)-1,1];
    coordinates = [newPosition;coordinates]; %#ok<AGROW>
end

end

% M02 End Program