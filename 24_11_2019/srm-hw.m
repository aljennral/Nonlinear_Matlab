clear all;
clc
N=60;
L=20;
[D,x]=cheb(N);
I=eye(N+1);
y=L*(x+1)/2;
D1=(2/L)*D;
D2=D1*D1;
fr=1-exp(-y)+y-1;
gr=(qi*exp(-y))/(qi+1);
gr1=-exp(-y);
its=20;
for k=1:its
%f matrix solving
 A=D1;
 A(N+1,:)=I(N+1,:);
R1=gr;
R1(N+1)=0;
frt=A\R1;
fr=frt;

A2=D^2+diag(1/2*(fr+1)D) - ha*I;
R2=Gr*gr+Gc*gr1-ha;
R2(N+1)=0;
frt=A2\R2;
fr=frt;

A3=D^2+diag(1/2*(pr*fr+1)*D); 
R3=0; R3(N+1)=0;
frt=A3\R3;

A4=D^2+diag(1/2*(Sc*fr+1))*D; 
R4=0; R4(N+1)=0;
frt=A3\R4;
fr=frt;
%g matrix solving
B=D2+0.5*diag(fr)*D1;
B(1,:)=I(1,:);
B(N+1,:)=I(N+1,:);
R2=zeros(N+1,1);
R2(N+1)=1;R2(1)=0;
grt=B\R2;
gr=grt;
gr1=D1*gr;
figure(1)
plot(y,fr);
figure(2)
plot(y,gr);

    
end