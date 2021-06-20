clc
clear all;
L=30;
m=1;
scale=2/L;
N=100;[D,x]=chep(N);
y=L*(x+1)/2;
D1=scale*D;D2=scale^2*D^2;D3=scale^3*D^3;I=eye(N+1);
u00=-y.*exp(-y);u01=D1*u00;u02=D1*u01;u03=D3*u00;
U00=u00;U01=u01;U02=u02;U03=u03;
ite=10;
for i=1:ite
   a=m;
   A=D3+diag(U00)*D2+diag(U02)-2*diag(U00)*D-m*I;
   R=(U03+U00.*U02-U01.*U01-m*U00);
A(1,:)=D(1,:);R(1)=-1;
A(N,:)=D(N+1,:);R(N)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
Um=A\R;
U00=U00+Um;
U01=D1*U00;
U02=D2*U00;
fprintf('%10.0f\t  %0.6f\n',i,U00(N))
end
plot(U00,y)