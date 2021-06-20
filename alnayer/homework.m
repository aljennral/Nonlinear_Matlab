clc;clear all;
N=input('N=');
[D,x]=chep(N);

D1=D;D2=D^2;I=eye(N+1);
f00=zeros(N+1,1);f01=zeros(N+1,1);f02=zeros(N+1,1);
beta=1;
M=1;
BB=[0.2 0.5 1 2];
for bb=1:length(BB)
    B=BB(bb);
    Fm=f00;Fm1=f01;Fm2=f02;
    it=10;
    for i=1:it
        a=1+beta*Fm/2;
        b=2*beta*Fm1.*Fm2/4;
        r=-(-B*M^2+Fm2+beta*Fm.*Fm2+(Fm1.^2));
        A1=diag(a)*D2/2+diag(b)*D/2;
        A1=A1(2:N,2:N);
        R=r(2:N);
        Y0=inv(A1)*R;
        f0=Y0;
        Fm=Fm+[0;f0;0]; Fm1=D*Fm/2;Fm2=D*Fm1/2;
        Up(:,i)=Fm1(1);
    end
     fprintf('%10.1f\t %10.8f\t %10.8f\t %10.8f\t %10.8f\t %10.8f\n',BB(bb),Up(:,2),Up(:,4),Up(:,6),Up(:,8),Up(:,10));
end
 