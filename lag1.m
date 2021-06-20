% Data
x=0:3;
fx = [-5, -6, -1,16];
plot(x,fx,'ro');
% Creata a vector of density spaced evaluation points 
x1 = 0:0.05:3;

% Apply Lagrange interpolation
p1 = (x1-x(2)).*(x1 - x(3)).*(x1-x(4))*5/6;
p2 = -3*(x1-x(1)).*(x1 - x(3)).*(x1-x(4));
p3 = 0.5*(x1-x(1)).*(x1 - x(2)).*(x1-x(4));
p4 = (x1-x(1)).*(x1 - x(2)).*(x1-x(3))*16/6;

p = p1 + p2 + p3 + p4;
hold on
plot(x1,p,'b','LineWidth',2)
axis([-1 4 -10 18]);A