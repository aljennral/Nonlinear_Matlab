clear all;
clc
N=100;
L=20;
[D,x]=cheb(N);

pr=0.72;
Ha=1;
gr=0.5;
gc=0.5;
sc=0.1;
Bi=0.5;

I=eye(N+1);
t=L*(x+1)/2;
scale=2/L;

D1=D*scale;
D2=D1^2;
D3=D1^3;

fr=exp(-t)+t-1;
fr1=D1*fr; 
fr2=D2*fr;
fr3=D3*fr; 

Gr=Bi*exp(-t)/(Bi+1);
Gr1=D1*Gr; 
Gr2=D2*Gr; 

qr=exp(-t);
qr1=D1*qr; 
qr2=D2*qr;

its=20;
for i=1:its
    A11 = D3+D2*diag(fr)-Ha*D1+0.5*diag(fr2)*I;
    A12 = -gr*I; 
    A13 = -gc*I; 
    R1=-(diag(fr3)+0.5*diag(fr)*diag(fr2)-Ha*diag(fr1)); %f'''(n)+9.5*f(n)+....
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A11(N+1,:) = I(N+1,:);  A12(N+1,:) =0;   A13(N+1,:) =0;  R1(N+1)=0;
    A11(N,:) = D1(N+1,:); A12(N,:) = 0; A13(N,:) = 0;  R1(N)=0;
    A11(1,:) = D1(1,:); A12(1,:) = 0; R1(1)=0; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A21 = 0.5*pr*diag(Gr1);
    A22 = D2+0.5*pr*diag(fr)*D1;
    A23 = zeros(N+1);
    R2 = -(diag(Gr2)+diag(fr)*diag(Gr1));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\
     A21(N+1,:) = 0; A22(N+1,:) = I(N+1,:); A23(N+1,:)=0; R2(N+1)=0; 
     R2(1) = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A31 = 0.5*sc*diag(qr1);
    A32 = zeros(N+1);
    A33 = D2 + 0.5*sc*diag(fr)*D1;
    R3 = -(diag(qr2)-diag(fr)*diag(qr1)*0.5*sc);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     A31(N+1,:)=0; A32(N+1,:)=0; A33(N+1,:)=I(N+1,:); R3(N+1)=-Bi; 
     A31(1,:) = 0; A32(1,:)=0; A33(1,:)=I(1,:);  
     R3(1)=0;

    A = [A11 A12 A13;A21 A22 A23;A31 A32 A33];
    R = [R1;R2;R3];
    M = inv(A)*R;
    fi = M(1:N+1)';
    Gi = M(N+2:2*N+2)';
    qi = M(2*N+3:3*N+3)';
    
    f=fi+fr; 
    fr=f;
    fr1=D1*f; 
    fr2=D2*f; 
    fr3=D3*f; 
    
    G = Gi + Gr;
    Gr = G; 
    G1 = D1*Gr; 
    G2 = D1*G1; 
    
    q = qi + qr;
    qr = q; 
    qr1 = D1*qr; 
    qr2 = D1*qr1; 
end
figure(1) 
plot(t,fr1)
figure(2)
plot(t,Gr)
figure(3)
plot(t,qr)