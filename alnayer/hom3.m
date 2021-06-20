clc
clear all; disp('no 3')
scale=2;
L=1;
N=100;[D,x]=chep(N);
y=(x+1)/2;
D1=scale*D;D2=scale^2*D^2;I=eye(N+1);
u00=1-y;u01=D1*u00;u02=D1*u01;
U00=u00;U01=u01;U02=u02;
ite=10;
for i=1:ite
A=D2+diag(U00)*D2+2*diag(U01)*D1+diag(U02)*I;
R=-(U02+U02.*U00+L*(U01.*U01));
A(1,:)=0;A(1,1)=1;R(1)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
Um=A\R;
U00=U00+Um;
U01=D1*U00;
U02=D2*U00;
fprintf('%10.0f\t %10.6f\n',i,U01(N))
end
plot(U00,y)