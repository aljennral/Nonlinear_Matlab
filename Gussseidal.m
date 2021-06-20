clear all
clc
%5x1+2x2+3x3=-1
%-3X1+9X2+X3=2
%2x1-x2-7x3=3
x1(1)=0; x2(1)=0; x3(1)=0;
N = 100;
n = 1;
TOL = 0.001;
while n<N
    x1(n+1) = -1/5 + (2/5)*x2(n) - (3/5)*x3(n);
    x2(n+1) = 2/9 + (3/9)*x1(n+1) - (1/9)*x3(n);
    x3(n+1) = -3/7 + (2/9)*x1(n+1) - (1/7)*x2(n+1);
    dx1 = abs(x1(n+1) - x1(n));
    dx2 = abs(x2(n+1) - x2(n));
    dx3 = abs(x3(n+1) - x3(n));
    if (dx1<TOL)&(dx2<TOL)&(dx3<TOL)
        break
    end
    n=n+1;
end
for i=1:6
    fprintf('%10.0f\t %10.3f\t %10.3f\t %10.3f\n',i-1,x1(i),x2(i),x3(i));
end
    