clear all;
clc;
N = 60;
[D,x]=cheb(N);
D1 = D;
D2 = D*D;
I = eye(N+1);
R_x = exp(x);
A = D2 - 4*D + 4*I;
  A(1,:) = I(1,:); R_x(1) = 0;
A(N+1,:) = I(N+1,:); R_x(N+1) = 0;
y_sol = A\R_x;
y_exact=(x*sinh(1) - cosh(1)).*exp(2*x) + exp(x);
x1 = [-1:0.1:1];
y_E = interp1(x,y_exact,x1,'spline');
figure(1)
plot(x,y_sol,'r');
hold on
plot(x1,y_E,'ko','MarkerEdgeColor','k','MarkerFaceColor',[0 0 0],'MarkerSize',4);