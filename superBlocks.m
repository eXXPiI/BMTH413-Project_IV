function [split, primeLeft] = superBlocks(bStart,bEnd,s)
    f = @(a,b,A,B) a < b | (a==b && A<B);
    split = 2;
    primeLeft = 1; %True
    [mxy,myx,Mxy,Myx] = N(bStart,bEnd,split,s,length(bStart));

    if mxy>myx
        primeLeft = 0; %False
        e = mxy;
        E = Mxy;
    else 
        primeLeft = 1;
        e = myx;
        E = Myx;
    end
%     stat=0;
    
     for i=3:length(bStart)-1
        [mxy,myx,Mxy,Myx] = N(bStart,bEnd,i,s,length(bStart));

        if f(e,mxy,E,Mxy)
            primeLeft = 0;
            e = mxy;
            E = Mxy;
            split = i;
        elseif f(e,myx,E,Myx)
            primeLeft = 1;
            e = myx;
            E = Myx;
            split= i;
        end
       
    

    end