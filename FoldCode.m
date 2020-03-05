%% Preamble
% Program: FoldCode.m
% Author: Jonathan Myers and Kathi Munoz-Hofmann
% Date: February 6, 2020
% Purpose: Take zero separators and blocks to fold protein and visualize.
% Arguments: None.
% Loads: None.
% Calls: None.
% Returns: None.

%% Setup
close all
clear
clc

%% Start
load HarvardSeq
% sequence1 = '100001000111100100000001101011000101101001';
% sequence2 = '1000010001111001000000010000101011000101101001';
% sequence3 = '10000100011101011010101001010101011001000000010000101011000101101001';

sequence = harvardSeq{10};

%% Identify Zero Separator Indices and Zero Separators/Blocks
filter = '(?<![0])([0]{2})*(?![0])';
[zeroStart,zeroEnd,separators,blocks] = regexp(...
    sequence,filter,'start','end','match','split','emptymatch'); %z0, z1, z2...

%% Identify Block Indices
[blockStart, blockEnd] = startEnd(zeroStart,zeroEnd);

%% Identify Superblocks
[superSplit, primeLeft] = superBlocks(blockStart,blockEnd,sequence);

%% Fold Protein (2-D)
coordinates = []; % Coordinates of residues
if ~isempty(separators{1,superSplit})
    coordinates = CenterZeroSeparator2D(coordinates,separators,superSplit);
end
for i = 0:2:superSplit
    coordinates = LeftFaceBlock2D(coordinates,blocks,superSplit-i);
    coordinates = LeftSeparator2D(coordinates,separators,blocks,superSplit-(i+1));
end
for i = 1:2:(length(separators)-superSplit+1)
    coordinates = RightFaceBlock2D(coordinates,blocks,superSplit+i);
    coordinates = RightSeparator2D(coordinates,separators,blocks,superSplit+i);
end

%% Visualize Protein
Visualizer(coordinates);

% M02 End Program