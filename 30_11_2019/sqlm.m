clear all;
clc
N=60;
L=30;
pr=0.72;
[D,x]=cheb(N);
I=eye(N+1);
sc=2/L;
t=L*(x+1)/2;
D1=sc*D;
D2=D1^2; D3=D1^3;
fr=exp(-t) + t -1;
fr1=D1*fr; 
fr2=D2*fr;
fr3=D3*fr; 
Gr=exp(-t);
Gr1=D1*Gr; 
Gr2=D2*Gr; 
its=20;
for i=1:20
%     A11=D3 + 0.5*(diag(fr)*D2 + diag(fr)*D2 + diag(fr2))*I  to blasius
 A11 = D3 + 0.5*(diag(fr)*D1 + diag(fr)*D1 + diag(fr2))*I;
    A12 = zeros(N+1); 
    A21 = zeros(N+1); 
    A22 = D2+0.5*(D1*diag(fr));
    R1=0.5*(diag(fr)*(diag(fr)*D2));
    R2=0.5*(pr*diag(fr)*(diag(Gr)*D2));
    
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
    
    A = [A11 A12;A21 A22];
    R = [R1;R2];
    V = inv(A)*R;
end

figure(1) 
plot(t,fr1)
figure(2)
plot(t,Gr)