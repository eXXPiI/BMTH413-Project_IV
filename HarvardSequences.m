%% Preamble
% Program: HarvardSequences.m
% Author: Jonathan Myers
% Date: February 13, 2020
% Purpose: Condition Harvard Sequences for use.
% Arguments: None.
% Loads: None.
% Calls: None.
% Returns: None.

%% Setup
close all
clear
clc

%% Start
harvardSeqHP = {'HPHHPPHHHHPHHHPPHHPPHPHHHPHPHHPPHHPPPHPPPPPPPPHH',...
    'HHHHPHHPHHHHHPPHPPHHPPHPPPPPPHPPHPPPHPPHHPPHHHPH',...
    'PHPHHPHHHHHHPPHPHPPHPHHPHPHPPPHPPHHPPHHPPHPHPPHP',...
    'PHPHHPPHPHHHPPHHPHHPPPHHHHHPPHPHHPHPHPPPPHPPHPHP',...
    'PPHPPPHPHHHHPPHHHHPHHPHHHPPHPHPHPPHPPPPPPHHPHHPH',...
    'HHHPPPHHPHPHHPHHPHHPHPPPPPPPHPHPPHPPPHPPHHHHHHPH',...
    'PHPPPPHPHHHPHPHHHHPHHPHHPPPHPHPPPHHHPPHHPPHHPPPH',...
    'PHHPHHHPHHHHPPHHHPPPPPPHPHHPPHHPHPPPPHHPHPHPHHPPP',...
    'PHPHPPPPHPHPHPPHPHHHHHHPPHHHPHPPHPHHPPHPHHHPPPPH',...
    'PHHPPPPPPHHPPPHHHPHPPHPHHPPHPPHPPHHPPHHHHHHHPPHH'};

harvardSeq = {};

for i = 1:length(harvardSeqHP)
    seq = harvardSeqHP{i};
    temp = '';
    for j = 1:strlength(seq)
        if seq(j) == 'H'
            temp = strcat(temp,'1');
        else
            temp = strcat(temp,'0');
        end
    end
    harvardSeq{i} = temp; %#ok<SAGROW>
end

% M02 End Program