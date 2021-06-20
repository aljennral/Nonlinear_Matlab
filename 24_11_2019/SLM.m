clear all; 
clc
N=100;
L=20;
pr=0.72;
aa=1.5;
[D,x]=cheb(N);
I=eye(N+1);
sc=2/L;
t=L*(x+1)/2;
D1=D*sc;
D2=D1^2; D3=D1^3;
Hr=t.*exp(-t) + exp(-t) -1;
Hr1=D1*Hr; 
Hr2=D2*Hr;
Hr3=D3*Hr; 
Gr=exp(-t);
Gr1=D1*Gr; 
Gr2=D2*Gr; 
its=20;
for i=1:its
    A11 = D3 + diag(Hr)*D2 + diag(Hr)*D1 + diag(Hr2)*I;
    A12 = -4*diag(Gr)*I; 
    A21 = diag(Gr)*D1 + diag(Gr1)*I; 
    A22 = D2 - diag(Hr)*D1 + diag(Hr1)*I;
    R1=-(Hr3 + Hr.*Hr2 + 0.5*Hr1.^2 - 2*Gr.^2);
    R2=-(Gr2 + Hr.*Gr1 + Hr1.*Gr);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A11(N+1,:) = I(N+1,:); 
    A12(N+1,:) =0;  R1(N+1)=0;
    A11(N,:) = D1(N+1,:); A12(N,:) = 0; R1(N)=0;
    A11(1,:) = D(1,:); A12(1,:) = 0; R1(1)=0; 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A21(N+1,:) = 0; A22(N+1,:) = I(N+1,:); R2(N+1)=0; 
    A21(1,:) = 0; A22(1,:) = I(1,:); R2(1) = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A = [A11 A12;A21 A22];
    R = [R1;R2];
    M = inv(A)*R;
    Hi = M(1:N+1);
    Gi = M(N+2:2*N+2);
    H = Hi + Hr; 
    Hr = H; 
    H1= D1*H; 
    H2=D2*H; 
    H3=D3*H; 
    G = Gi + Gr;
    Gr = G; 
    G1 = D1*Gr; 
    G2 = D1*G1; 
end
figure(1) 
k=plot(t,Hr1)
figure(2)
plot(t,Gr1)
figure(3)
plot(t,Gr)