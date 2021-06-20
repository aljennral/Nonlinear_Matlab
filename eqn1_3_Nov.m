clear all;
clc;
N=20;
[D,x]=cheb(N);
a=1; b=3;
t=0.5*(b-a)*x + (b+a)/2;
I=eye(N+1);
D1=D;
D2=D1^2;
A=D2 + diag(1./t)*D1 - diag((1./t).^2 )*I;
R_t = zeros(N+1,1);
A(N+1,:)= I(N+1,:);  R_t(N+1)=5; %A(N+1,:)= 0;A(N+1,N+1)=1;
A(1,:)= I(1,:); R_t(1)=2;  %A(1,:)= 0;A(1,1)=1;
y_sol=inv(A)*R_t;
figure(1)
plot(t,y_sol);
