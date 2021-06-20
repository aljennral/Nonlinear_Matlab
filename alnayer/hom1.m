clear all;clc;disp('no 1')
N=100;
[D,x]=chep(N);
D1=D;
D2=D^2;
I=eye(N+1);
u00=1-x.^2;
u01=D1*u00;
u02=D2*u00;
U00=u00;
U01=u01;
U02=u02;
ite=20;
for i=1:ite
a=(U00+1);
A=D2-diag(a)*I;
R=1-U02+U00+(U00.*U00)/2;
A(1,:)=0;
A(1,1)=1;
R(1)=0;
A(N+1,:)=0;
A(N+1,N+1)=1;
R(N+1)=0;
Um=A\R;
U00=U00+Um;
U01=D1*U00;
U02=D2*U00;
fprintf('%10.0f\t %0.5f\t %0.5f\t  %0.5f\n',i,U02(N+1),U01(N+1),U00(N+1));
end
plot(U00,x)