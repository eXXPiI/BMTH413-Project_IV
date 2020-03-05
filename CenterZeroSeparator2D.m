%% Preamble
% Program: CenterZeroSeparator2D.m
% Author: Jonathan Myers
% Date: February 11, 2020
% Purpose: Fold Center Zero Separator in protein sequence.
% Arguments: Coordinates of residues, zero separators, and split index.
% Loads: None.
% Calls: None.
% Returns: None.

%% Function
function coordinates = CenterZeroSeparator2D(coordinates,separators,superSplit)
len = strlength(separators{1,superSplit});
verticalLen = len/2;

for i = 0:verticalLen-1
    rightSide = [0,-i,0];
    leftSide = [1,-i,0];
    coordinates = [rightSide;coordinates;leftSide]; %#ok<AGROW>
end

% M02 End Program