clear all
clc
N=100; 
[D x] = cheb(N);
t=5*(x+1);
D1=(1/5)*D; %D here over -1 1 domain
D2=D1^2;
D3=D1^3;
f=exp(x);
I=eye(N+1);
A=D2-4*D+4*I;
A(N+1,:)=I(N+1,:); f(N+1)=0;
A(1,:)=I(1,:); f(1)=0;
u=A\f; xx=-1:0.1; 
u_exact = (xx*sinh(1)-cosh(1)).*exp(2*xx)+exp(xx);
plot(x,u)
