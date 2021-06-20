clear all;
clc
N=100;
L=20;
[D,x]=cheb(N);

pr=0.72;
Ha=1;
Gr=0.5;
gc=0.5;
sc=0.1;
Bi=0.5;

I=eye(N+1);
t=L*(x+1)/2;
scale=2/L;

D1=scale*D;
D2=D1^2;
D3=D1^3;

fr=exp(-1+t);
fr1=D1*fr; 
fr2=D2*fr;
fr3=D3*fr; 

thetar=Bi*exp(-t)/(Bi+1);
thetar1=D1*thetar; 
thetar2=D2*thetar; 

qr=exp(-t);
qr1=D1*qr; 
qr2=D2*qr;

its=20;
for i=1:20
%      A11=D3 + 0.5*(diag(fr)*D2 + diag(fr)*D2 + diag(fr2))*I % to blasius
    A11 = D3 + 0.5*diag(fr)*D2  -Ha*D1 + diag(fr2);
    A12 = -Gr*I; 
    A13 = -gc*I; 
     R1=0.5*(diag(fr)*(diag(fr)*D2));
    A21 = D2 + 0.5*pr*(diag(fr)*diag(thetar1));
    A22 =  D2+ 0.5*pr*diag(fr)*D1;
    A23 = zeros(N+1);
    R2 = zeros(N+1);
    A31 = zeros(N+1);
    A32 = zeros(N+1);
    A33 = D2 + 0.5*sc*diag(fr)*D1;
    R3=zeros(N+1);
    
    A11(N+1,:) = I(N+1,:); 
    A12(N+1,:) =0;  
    % is f(0) and f'(0) result value
    R1(N+1)=0; R1(N)=0;
    A11(N,:) = D1(N+1,:);
    A12(N,:) = 0; R1(N)=0;
    A11(1,:) = D(1,:); 
    A12(1,:) = 0; R1(1)=1;
    
    A21(N+1,:) = 0; A22(N+1,:) = I(N+1,:); R2(N+1)=1; 
    A21(1,:) = 0; A22(1,:) = I(1,:);  R2(1)=0;
    
    A = [A11 A12 A13;A21 A22 A23;A31 A32 A33];
    R = [R1;R2;R3];
    V = inv(A)*R;
end

figure(1) 
plot(t,fr)
figure(2)
plot(t,thetar)
figure(3)
plot(t,qr)