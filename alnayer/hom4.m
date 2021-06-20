clc
clear all;disp('no 4')
N=100;
[D,x]=chep(N);
scale=2;
y=(1+x)/2;
a=3.14/30;Re=1;H=1;
D1=scale*D;D2=scale^2*D^2;D3=scale^3*D^3;
u00=1-x.^2;u01=D1*u00;u02=D2*u00;u03=D3*u00;
U00=u00;U01=u01;U02=u02;U03=u03;
ite=10;
for i=1:ite
A=D3+2*a*Re*diag(U00)*D2+(4-H)*D1;
R=-(U03+2*a*Re*U00.*U02+(4-H)*U01);
A(1,:)=0;A(1,1)=1;R(1)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
A(N,:)=D1(N+1,:);R(N)=0;
Um=A\R;
U00=U00+Um;
U01=D1*U00;
U02=D2*U00;
U03=D3*U00;
fprintf('%10.0f\t %0.5f\n',i,U00(N))
end
plot(U00,y)