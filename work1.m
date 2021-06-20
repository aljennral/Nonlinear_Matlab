clear all ;
clc ;
N=120 ;
[D,x]=cheb(N);
I=eye(N+1);
M=2;
L=20 ;
m=0.2;
z=0.1;
y=L*(x+1)/2;
sc=2/L;
D1=sc*D ;
D2=D1^2 ;
D3=D1*D2 ;
gr=exp(-y);%gr=y.*exp(-y) ;
fr = 1 - exp(-y);%fr=2-exp(-y)-y.*exp(-y) ;
gr1 = exp(-y) ;
wr = exp(-y);
its=30 ;
%%%%%%%%%%%%%%%%%%%%%%%
for r=1:its
    % A=D ;
   %R1 = gr ;
    A =  D2 + diag(fr - z*y/2)*D1 - (z + M/(1+m^2))*I;
    R1 = (M*m/(1+m^2))*wr + gr.^2
    A(N+1,:)=I(N+1,:) ;R1(N+1)=1 ;
    A(1,:)=I(1,:); R1(1)=0;
    grt=inv(A)*R1 ;
    g_error=abs(grt-gr) ;
    gr=grt ;
    %%%%%%%%%%%%%%%%%%%%
    B  = D1;% B=D2+diag((fr+1)-z*y/2).*D1-(z+M/(1+m^2)).*I ;
    R2 = gr;
   % R2=gr.^2+M/(1+m^2)*M.*wr;
   % B(N+1,:)=I(N+1,:) ; R2(N+1)=0 ;
    B(1,:)=I(1,:);R2(1)=0 ;
    frt=inv(B)*R2 ;
    f_error=abs(frt-fr) ;
    fr=frt ;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    BB=  D2 + diag(fr - z*y/2)*D1 - diag(gr + z + M/(1+m^2))*I;
%c=D2+diag((fr+1)-z*y/2)*D1-(gr+1+z+M/(1+m^2))*wr+1;
    R3=-M/(1+m^2)*m*gr;
    BB(N+1,:)=I(N+1,:);    R3(N+1)=1;
    BB(1,:)=I(1,:);    R3(1)=0;   
end
figure(1)
plot(y,fr,'r');
figure(2)
plot(y,gr);
figure(3)
plot(y,wr);