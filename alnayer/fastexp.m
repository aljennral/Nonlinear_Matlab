function c =fastexp(a,b,n)
expon=b;
c=ones(size(a));
fact=a;
while(expon>0)
    if(mod(expon,2)==1)
        c=mod(c.*fact,n);
    end
    expon=floor(expon/2);
    fact=mod(fact.*fact,n);
end
end