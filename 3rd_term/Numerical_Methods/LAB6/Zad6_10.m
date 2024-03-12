clear all;
close all;
clc;

f = @(x) 1./(1+x.^2);
p = @(x, A0, A1, A2, B1, B2) (A0 + A1*x + A2*x.^2)./(1 + B1*x + B2 * x.^2);
xVal = linspace(-5,5,100);

syms x;
symF = f(x);
taylorF = taylor(symF, 'Order', 5)


M = 2;
N = 2;

syms A0 A1 A2 B1 B2;

equations = [A0 == 1, A1 == B1, A2 == B2 - 1, B1 == 0, B2 == 1];

sol = solve(equations, [A0, A1, A2, B1, B2]);
disp(sol);



figure;
plot(xVal, f(xVal),"b-");
hold on;
plot(xVal, p(xVal, sol.A0, sol.A1, sol.A2, sol.B1, sol.B2), "r-"); % nakłada się bo są te same "bo"
grid on;
