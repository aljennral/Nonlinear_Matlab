% f"'+(1+la)[M^2f'-Re(f'^2-ff")]-B(2f'f"-ff"")=0
% f(0)=0 ; f"(0)=0
% f(inf)=0.5 ; f'(inf)=0
% Re=2 ; M=0.5 ;B=0.1 ;la=0.2

clear all
clc
N=100;
L=20;
[D,x]=chep(N);
%------------------------------------------------
Re=2;
M=0.5;
B=0.1;
la=0.2;
%-------------------------------------------------
scale =2/L;
I=eye(N+1);
%-------------------------------------------------------------
D1=scale*D;
D2=(scale^2*D^2);
D3=(scale^3*D^3);
D4=(scale^4*D^4);
y=L*(x+1)/2;
%-------------------------------------------------------------
f00=0.5-0.5*exp(-2*y)-y.*exp(-y);
f01=D1*f00;
f02=D2*f00;
f03=D3*f00;
f04=D4*f00;
%-------------------------------------------------------------
F00=f00;
F01=f01;
F02=f02;
F03=f03;
F04=f04;
%-------------------------------------------------------------
ite=10;
disp('_________________________________________________________________________________')
disp('        i            F00(N+1)         F01(N+1)        F02(N+1)      F03(N+1)       F04(N+1)')
disp('_________________________________________________________________________________')
for i=1:ite
%-------------------------------------------------------------
A=diag(B*F00)*D4+D3+diag((1+la)*F00-2*B*F01)*D2+diag(-(1+la)*M^2+2*Re*(1+la)*F01-2*B*F02)*D1+diag((1+la)*F02+B*F03);
R=-(F03-(1+la)*M^2*F01+Re*(1+la)*F01.^2+(1+la)*F00.*F02-B*F01.*F02+B*F00.*F04);
%-------------------------------------------------------------
A(1,:)=0;A(1,1)=1;R(1)=0;
A(2,:)=D1(1,:);R(2)=0;
A(N,:)=D2(N+1,:);R(N)=0;
A(N+1,:)=0;A(N+1,N+1)=1;R(N+1)=0;
%--------------------------------------------------------------
Fm=A\R;
F00=F00+Fm;
F01=D1*F00;
F02=D2*F00;
F03=D3*F00;
F04=D4*F00;
%----------------------------------------------------------------

fprintf('%10.0f\t %0.8f\t %0.8f\t %0.8f\t %0.8f\t %0.8f\n',i,F00(N+1),F01(N+1),F02(N+1),-F03(N+1),F04(N+1))
end
plot(y,F00)