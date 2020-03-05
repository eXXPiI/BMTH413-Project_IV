% P = prots();
% allSS = OnesZerosS(P);
% allS = OnesZeros(P);
%s = [1 0 1 0 0 0 1 1 1 1 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 1 1 0 0 0 1 0 1 1 0 1 0 0 1]; %allS{5};

%#ok<*NOPTS>

ss =  '101000100100100100100000001001010100100010100101001'; % Must be character vector rather than string.
%      101000100100
filter1 = "(?<![0])([0]{2})*(?![0])";
%indexes of zero separators 
[Start, End] = regexp(ss, filter1, "emptymatch"); %z0, z1, z2...

[bStart, bEnd] = startEnd(Start,End);

[superSplit, primeLeft] = superBlocks(bStart,bEnd,ss);

fprintf('Results are in folks! \n')
fprintf('The split point is \n') 
superSplit
fprintf('The Superblocks are... \n')
fprintf('Left block \n')
ss(1:End(superSplit))
fprintf('Right block \n')
ss(bStart(superSplit):end)
fprintf('Is the prime block the left block? \n')
primeLeft
