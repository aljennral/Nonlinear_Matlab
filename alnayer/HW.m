clear all;
clc
format long
N=200;
[D,x]=chep(N);
scale=2;
D1=scale*D;
D2=scale^2*D^2;
y=(x+1)/2;
f00=1+y-y.^2;
f01=1-2*y;
f02=-2;
Fm=f00;
Fm1=f01;
Fm2=f02;
ite=10;
for i=1:ite
   a=-(1+Fm);
A=D^2+diag(a);
R=1-Fm2+Fm+0.5*(Fm.*Fm);
A(1,:)=0;A(1,1)=1;R(1)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
Um=A\R;
Fm=Fm+Um;
Fm1=D1*Fm;
Fm2=D2*Fm;

    fprintf('%10.0f\t %0.8f\n',i,Fm1(N+1));
end
figure(1)
plot(y,Fm,'R','linewidth',3)
hold on
plot(y,Fm2,'k','linewidth',3)
hold on
plot(y,Fm1,'k','linewidth',3)
