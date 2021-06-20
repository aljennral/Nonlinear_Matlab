clear all;
clc
N=60;
L=30;
[D,x]=cheb(N);
I=eye(N+1);
sc=2/L;
pr=0.72;
t=L*(x+1)/2;
D1=sc*D;
D2=D1^2; 
D3=D1^3;
gr = exp(-t);
fr = t+exp(-t)-1;
hr1=D1*fr; 
hr2=D2*fr;
hr3=D3*fr; 
gr1=D1*gr; 
gr2=D2*gr;
gr3=D3*gr; 
its=20; 
for i=1:its 
    A1 = D1;  R1 = fr;
    A1(N+1,:) = I(N+1,:); R1=zeros(N+1,1);
    R1(N+1)=0; R1(N)=0;  R1(1)=1;
    ht=A1\R1;
  
    hr=ht;
    hr1=D1*hr;
    hr2=D2*hr;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A2 = D2+0.5*diag(fr)*D1;
    A2(N+1,:) = I(N+1,:); R2=0.5*gr; %=zeros(N+1,1);
    R2(1)=0; R2(N+1)=1; 
    gt = A2\R2;
    
    gr=gt;
    gr1=D1*gr;
    gr2=D2*gr;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     A3 = D2 + 0.5*pr*diag(hr1)*D1;
%     A3(N+1,:) = I(N+1,:); R3(N+1)=0; %=zeros(N+1,1);
%     qt = A2\R3;
%     
%     qr=qt;
%     qr1=D1*qr;
%     qr2=D2*qr;
end
figure(1) 
plot(t,hr1)
figure(2)
plot(t,gr)