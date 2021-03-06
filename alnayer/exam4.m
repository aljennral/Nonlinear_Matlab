%  (1+K)*F'''+Re(F'^2-FF'')-Kg'
%  (1+K/2)g''-Re(Fg'-F'g)-K(2K-F'')
%   f'(1/2)=0, f(1/2)=1/2, f(0)=0
%   g(1/2)=0,  g'(0)=0 
clear all
clc;
N=100;
Re=1;
k=1;
[D,x]=cheb(N);
scale=4; D1=scale*D;
D2=(scale^2*D^2);
D3=(scale^3*D^3);
y=(x+1)/4;
I=eye(N+1);
%--------------------------------------------------------
f00=2*(-y.^2+y);
f01=D1*f00;
f02=D2*f00;
f03=D3*f00;  
%------------------------------------------------------------
g00=y.^2-1/4;
g01=D1*g00;
g02=D2*g00;
ite=20;
F00=f00;  F01=f01; F02=f02; F03=f03;
G00=g00;G01=g01;G02=g02;
disp('_______________________________________________________________')
disp('         i      F00(N+1)   F01(N+1)   G00(N+1)     G01(N+1)')
disp('_______________________________________________________________')
for m=1:ite
    a1=(k+1);a2=-Re*F00;a3=2*Re*F01;
    a4=-Re*F02; a5=-k;
    R1=-(k+1)*F03-Re*F01.^2+Re*F00.*F02+k*G01;
    A11=a1*D3+diag(a2)*D2+diag(a3)*D1+diag(a4)*I;
    A12=a5*D1;
    
    %-------------------------------------------------------------------
    b1=k;b2=Re*G00;b3=-Re*G01;
    c1=(1+(k/2));
    c2=-Re*F00;
    c3=diag((Re*F01))-(2*k)*I;
    R2=-(1+(k/2))*G02-Re*F01.*G00+Re*F00.*G01+2*k*G00-k*F02;
    A21=b1*D2+diag(b2)*D1+diag(b3)*I;
    A22=c1*D2+diag(c2)*D1+c3;
    %-------------------------------------------------------------------
    A11(2,:)=D1(1,:);  A12(2,:)=0;R1(2)=0; 
    A11(1,:)=0;A11(1,1)=1; A12(1,:)=0;R1(1)=0; 
    A11(N+1,:)=0;A11(N+1,N+1)=1;R1(N+1)=0; A12(N+1,:)=0; 

   %---------------------------------------------------------------------
   A22(1,:)=0;A22(1,1)=1;     A21(1,:)=0;R2(1)=0; 
   A22(N+1,:)=D1(N+1,:); A21(N+1,:)=0; R2(N+1)=0;  

   %---------------------------------------------------------------------
   A= [A11 A12 ;A21 A22];
    R=[R1;R2];
      Y=A\R;
      Fm=Y(1:N+1); Gm=Y(N+2:2*N+2); 
      F00=F00+Fm;
      F01=D1*F00;
      F02=D2*F00;
      F03=D3*F00;
 %-----------------------------------------------------------------------     
     G00=G00+Gm;
     G01=D1*G00;
      G02=D2*G00;
    
  fprintf('%10.0f\t %0.6f\t %0.6f\t %0.6f\t %0.6f\n',m,F00(N+1),F01(N+1),G00(N+1),G01(N+1));
end
figure(1)
plot(y,F00)
figure(2)
plot(y,G00)

