clear all;
clc
N=60;
L=20;
M=2;
[D,x]=cheb(N);
I=eye(N+1);
y=L*(x+1)/2;
D1=(2/L)*D;
D2=D1*D1;
fr=1-exp(-y);
gr=exp(-y);
gr1=-exp(-y);
its=20;
for k=1:its
%f solution
 A=D1;A(N+1,:)=I(N+1,:);
R1=gr;R1(N+1)=0;
frt=A\R1;
fr=frt;
%g solution
B=D2+0.5*diag(fr)*D1 -(M^2)*I;
B(1,:)=I(1,:);
B(N+1,:)=I(N+1,:);
R2=gr.^2;
R2(N+1)=1;R2(1)=0;
grt=B\R2;
gr=grt;
gr1=D1*gr;
figure(1)
plot(y,fr);
figure(2)
plot(y,gr);

    
end