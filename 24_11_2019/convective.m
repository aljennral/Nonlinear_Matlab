clear all;
clc
N=60;
L=20;
pr=0.72;
aa=1.5;
[D,x]=cheb(N);
I=eye(N+1);
y=L*(x+1)/2;
D1=(2/L)*D;
D2=D1*D1;
fr=y-1+exp(-y);
gr=1-exp(-y);
gr1=exp(-y);
thetar=(aa/(1+aa))*exp(-y);
thetar1=D1*thetar;
its=20;
for k=1:its
%f solution
 A=D1; A(N+1,:)=I(N+1,:);
R1=gr;R1(N+1)=0;
frt=A\R1;
fr=frt;
%g solution
B=D2+0.5*diag(fr)*D1;
B(1,:)=I(1,:);
B(N+1,:)=I(N+1,:);
R2=zeros(N+1,1);
R2(N+1)=0;R2(1)=1;
grt=B\R2;
gr=grt;
gr1=D1*gr;
E=D2+0.5*diag(pr*fr)*D1;
R3=zeros(N+1,1);
E(1,:)=I(1,:);R3(1)=0;
E(N+1,:)=D1(N+1,:)-aa*I(N+1,:);R3(N+1)=-aa;
thetart=E\R3;
thetar=thetart;
thetar1=D1*thetar;
end
figure(1)
plot(y,fr);
figure(2)
plot(y,gr);
figure(3)
plot(y,thetar);
hold on


    