clear all
clc
N=100; 
[D x] = cheb(N);
t=5*(x+1);
D1=(1/5)*D; %D here over -1 1 domain
D2=D1^2;
D3=D1^3;
y=sin(t).*exp(t);
y1=D1*y;
y2=D2*y;
y3=D3*y; 
y1_exc=exp(t).*cos(t) + exp(t).*sin(t);
y2_exc=2.*exp(t).*cos(t);
y3_exc=2.*exp(t).*cos(t)-2.*exp(t).*sin(t);
figure(1)
% fprintf('%10.5f\t %10.5f\t %10.5f\n',y1,y2,y3);
plot(t,y1,'r');
hold on
plot(t,y1_exc,'b*');
figure(2)
% fprintf('%10.5f\t %10.5f\t %10.5f\n',y1,y2,y3);
plot(t,y2,'r');
hold on
plot(t,y2_exc,'b*');
figure(3)
% fprintf('%10.5f\t %10.5f\t %10.5f\n',y1,y2,y3);
plot(t,y3,'r');
hold on
plot(t,y3_exc,'b*');
% % supplot(1,3,1)
% % plot(t,y1_exc,'r')
% hold on
% plot(y1,y1_exc)
% hold off
% %% supplot(1,3,2)
% figure
% plot(t,y1_exc,'r')
% hold on
% plot(y2,y1_exc)
% hold off
% figure
% %% supplot(1,3,3)
% plot(t,y1_exc,'r')
% hold on
% plot(y3,y1_exc)
% hold off