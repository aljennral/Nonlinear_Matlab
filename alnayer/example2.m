clear all
clc
x1(1)=0;x2(1)=0;x3(1)=0;x4(1)=0;
N=100;n=1;
TOL=0.0001;
while n<N
    x1(n+1)=6/10+(1/10)*x2(n)-(2/10)*x3(n);
    x2(n+1)=(25+x1(n+1)+x3(n)-3*x4(n))/11;
    x3(n+1)=(-11-x1(n+1)+11*x2(n+1)+3*x4(n))/10;
    x4(n+1)=(15-3*x2(n+1)+x3(n+1))/8;
 dx1=abs(x1(n+1)-x1(n));
dx2=abs(x2(n+1)-x2(n));
dx3=abs(x3(n+1)-x3(n));
dx4=abs(x4(n+1)-x4(n));
if (dx1<TOL)&(dx2<TOL)&(dx3<TOL)&(dx4<TOL)
    break
end
n=n+1;
end
for i=1:6
    fprintf('%10.0f\t %10.3f\t %10.3f\t %10.3f\t %10.3f\n',i-1,x1(i),x2(i),x3(i),x4(i));
end