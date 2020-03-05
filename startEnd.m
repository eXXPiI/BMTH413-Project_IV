function[bStart,bEnd]  = startEnd(Start, End)
    bStart = [];
    bEnd = [];
    % indexes of blocks
    for i=1:length(Start)-1
            bStart = [bStart End(i)+1];
            bEnd = [bEnd Start(i+1)-1];
    end
    bStart;
    bEnd;