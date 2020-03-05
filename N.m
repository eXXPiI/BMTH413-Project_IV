function [mxy,myx,Mxy,Myx] = N(bStart,bEnd,split,s,k)
    y1 = 1:2:split-1;
    x1 = 2:2:split-1;
    if rem(split,2)==0
        x2 = split:2:k;
        y2 = split+1:2:k;
    else
        y2 = split:2:k;
        x2 = split+1:2:k;
    end
    y1sum = 0;
    for i=y1
        y1sum = y1sum + sum(s(bStart(i):bEnd(i)));
    end
    x1sum = 0;
    for i=x1
        x1sum = x1sum + sum(s(bStart(i):bEnd(i)));
    end
    y2sum = 0;
    for i=y2
        y2sum = y2sum + sum(s(bStart(i):bEnd(i)));
    end
    x2sum = 0;
    for i=x2
        x2sum = x2sum + sum(s(bStart(i):bEnd(i)));
    end
    mxy = min(x1sum,y2sum);
    myx = min(y1sum,x2sum);
    Mxy = max(x1sum,y2sum);
    Myx = max(y1sum,x2sum);
    
    
end
