clear all;
clc
N=100;
L=20;
[D,x]=cheb(N);
I=eye(N+1);
sc=2/L;
t=L*(x+1)/2;
D1=sc*D;
D2=D1^2; 
D3=D1^3;
Hr=t.*exp(-t) + exp(-t) -1;
Gr=exp(-t);
Hr1=D1*Hr; 
Hr2=D2*Hr; 
Gr1=D1*Gr; 
Gr2=D2*Gr; 
fr=t.*exp(-t);
its=20; 
for i=1:its 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A1 = D1; R1 = fr;
    A1(N+1,:) = I(N+1,:);  R1(N+1)=0;
    Ht=inv(A1)*R1;
    
    Hr=Ht; 
    Hr1=D1*Hr;
    Hr2=D2*Hr;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        A2 = (D2 + diag(Hr1)*D1);
    A2(N+1,:) = I(N+1,:); R2=-0.5*Hr2 + 2*Gr2; 
    Gt=inv(A2)*R2;
    Gr=Gt; 
    Gr1=D1*Gr;
    Gr2=D2*Gr;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %     equation 2 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A3 = (D2-diag(Hr1)*D1+diag(Hr1));
    A3(N+1,:)=I(N+1,:); 
    R3=0; 
    qt=inv(A3)*R3;
    qr=qt; 
    qr1=D1*qr;
    qr2=D2*qr;
end
figure(1) 
plot(t,Hr1)
figure(2) 
plot(t,qr1)