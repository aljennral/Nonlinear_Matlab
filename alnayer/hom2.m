clear all;
clc
N=100;
[D,x]=chep(N);

D1=D;D2=D^2;I=eye(N+1);
u00=1+x.^2;u01=D1*u00;u02=D1*u01;
U00=u00;U01=u01;U02=u02;
ite=10;
for i=1:ite
a=2*U00;
A=D2+diag(2/x)*D1+diag(a);
R=-(U02+(2/x)*U01+(U00.*U00));
A(1,:)=0;A(1,1)=1;R(1)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
Um=A\R;
U00=U00+Um;
U01=D1*U00;
U02=D2*U00;
fprintf('%10.0f\t %0.13f\n',i,U00(N))
end
plot(U00,x)