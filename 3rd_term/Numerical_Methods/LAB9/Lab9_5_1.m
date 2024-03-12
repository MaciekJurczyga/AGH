clear all
close all
clc
it = 14;
a1 = tan(45 * pi/180);
a2 = tan(10 * pi/180);
a3 = tan(80 * pi/180);
f = @(x) (a1/2)*x.^2 + x - 5;
fp = @(x) a1*x +1;
x = -10:0.01:10;
% dla 45 stopni mz = 2,32
a =  2.32-2;  
b = 2.32+2 ;
% dla 10 stopni mz = 3,78
% a =  3.78-2;  
% b = 3.78+2 ;
% % dla 80 stopni mz = 1,16
% a = 1.16 + 2;
% b = 1.16 - 2;

plot(x, f(x), "b-", x, fp(x), "r-"); grid; xlabel("x"); title("f(x), fp(x)");
legend("Funkcja", "Jej pochodna"); pause
cb = nonlinsolvers(f, fp, a, b, "bisection", it);
cr = nonlinsolvers(f, fp, a, b, "regula-falsi", it);
cn = nonlinsolvers(f, fp, a, b, "newton-raphson", it);
plot( 1:it, cn, "^-"); xlabel("iter"); title("c(iter)")
grid on; legend( "Newton-Raphson");