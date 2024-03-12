clear all;
close all;
clc;

syms w1 w2 w3;
x = [-(3/5)^(1/2), 0, (3/5)^(1/2)];

equations = [w1+w2+w3 == 2,...
             w1*x(1) + w2*x(2) + w3*x(3) == 0, ...
             w1*x(1)^2 + w2*x(2)^2+ w3*x(3)^2 == 2/3, ...
             w1*x(1)^3 + w2*x(2)^3 + w3*x(3)^3 == 0];

sol = solve(equations, [w1,w2,w3]);
display(sol);
