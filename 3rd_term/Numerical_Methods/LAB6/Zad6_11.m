clear all;
close all;
clc;

p2 = @(x, A0, A1, A2, B1, B2) (A0 + A1*x + A2*x.^2)./(1 + B1*x + B2 * x.^2);
p3 = @(x, A0, A1, A2, A3, B1, B2, B3) (A0 + A1*x + A2*x.^2 + A3*x.^3)./(1 + B1*x + B2 * x.^2 + B3*x.^3);
xVal = linspace(-2,2,100);

syms x;
taylorF2 = taylor(erf(x), 'Order', 5)
taylorF3 = taylor(erf(x), 'Order', 7) 

syms A0 A1 A2 A3 B1 B2 B3;

equations2 = [A0 == 0, A1 == 2/pi^(1/2), A2 == 0, B2 == 1/3, B1 == 0];
equations3 = [A0 == 0, A1 == 2/pi^(1/2), A2 == 0, A3 == -2/(30*pi^(1/2)), B1 == 0, B2 == 3/10, B3 == 0];

sol = solve(equations2, [A0, A1, A2, B1, B2]);
sol2 = solve(equations3, [A0, A1, A2, A3, B1, B2, B3]);
disp(sol);
disp(sol2);



figure;
plot(xVal, erf(xVal),"b-");
hold on;
plot(xVal, p2(xVal, sol.A0, sol.A1, sol.A2, sol.B1, sol.B2), "r-");
hold on;
plot(xVal, p3(xVal, sol2.A0, sol2.A1, sol2.A2, sol2.A3, sol2.B1, sol2.B2, sol2.B3), "g-");
grid on;
legend("original", "Pade 2,2", "Pade 3,3");