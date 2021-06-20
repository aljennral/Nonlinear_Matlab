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

D1=D*scale;
D2=D1^2;
D3=D1^3;

fr=exp(-1)+t-1;
fr1=D1*fr; 
fr2=D2*fr;
fr3=D3*fr; 

thetar=Bi*exp(-t)/(Bi+1);
thetar1=D1*Gr; 
thetar2=D2*Gr; 

qr=exp(-t);
qr1=D1*qr; 
qr2=D2*qr;

gr=t.*exp(-t);
its=20;
for i=1:20
    A1=D1;  R1=gr;
    A1(N+1,:)=I(N+1,:); R1(N+1)=0;
    ft=A1\R1;
    fr=ft;
    fr1=D1*fr;
    fr2=D2*fr;
    
    A2=D2 + diag(0.5*fr)*D1-Ha*I;  
    R2=Gr*diag(thetar)+gc*diag(qr)-Ha;
    A2(N+1,:)=I(N+1,:); R2(N+1)=0;
    thetat=A1\R1;
    thetar=thetat; 
    thetar1=D1*thetar;
    thetar2=D2*thetar;
    
    A3=D2 + diag(0.5*fr)*D1;  R2=0;
    A3(N+1,:)=I(N+1,:); R3(N+1)=0;
    qt=A1\R1;
    qr=qt;
    qr1=D1*qr;
    qr2=D2*qr;
    
    A3=D2 + 0.5*diag(fr)*D1;  R2=0;
    A3(N+1,:)=I(N+1,:); R3(N+1)=0;
    zt=A1\R1;
    zr=zt;  
    zr1=D1*zr;
    zr2=D2*zr;
end
figure(1)
plot(t,fr1)
figure(2)
plot(t,thetar)
figure(3)
plot(t,qr)