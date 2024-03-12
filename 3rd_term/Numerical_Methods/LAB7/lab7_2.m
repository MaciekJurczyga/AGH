clear all; close all; clc
y = @(x) sin(x);

h = pi/4;
x0 = pi/4;

x = [x0-h, x0, x0+h];
y_values = [y(x0-h), y(x0), y(x0+h)];

fx1 = (1/2*h)*(-3*y(1) + 4*y(2) - y(3));
fx2 = (1/2*h)*(y(3) - y(1));
fx3 = (1/2*h)*(y(1) - 4*y(2) + 3*y(3));

%dokladne wartosci:
syms x;
ys = eval([subs(diff(y(x), x), x, x0-h), ... % wartosc pierwszej pochodnej fun y w punkcie x0 - h
       subs(diff(y(x), x), x, x0), ...  % wartosc pierwszej pochodnej fun y w punkcie x0 
       subs(diff(y(x), x), x, x0+h)]);
%roznica miedzy metota interpolacji Newtona a wartosciami rzeczywistymi
errors = ([abs(fx1 - ys(1)), abs(fx2 - ys(2)), abs(fx3 - ys(3))]);

disp("fx1 = " + fx1);
disp("fx2 = " + fx2);
disp("fx3 = " + fx3);
disp("prawidlowe wartosci: ");
disp(ys);
disp("roznica w wynikach: ");
disp(errors);
%DRUGA CZESC ZADANIA
disp("DLA WIELOMIANU")
y = @(x) 2*x.^2 + x + 1/2;

h = 1;
x0 = 1;
 
xs = [x0, x0+h, x0+2*h];
ys = [y(x0), y(x0+h), y(x0+2*h)];
disp("poprawne wartości: ")
ys_diff_from_func = [eval( (subs(diff(y,x,1),x,x0)) ), eval( (subs(diff(y,x,1),x,x0+h)) ), eval( (subs(diff(y,x,1),x,x0+2*h)) )], %to dokładne wartości pochodnych

fp_1 = 1/(2*h) * (-3*ys(1) + 4*ys(2) - ys(3));
fp_2 = 1/(2*h) * (ys(3) - ys(1));
fp_3 = 1/(2*h) * (ys(1) - 4*ys(2) +3*ys(3));
disp("wartości obliczone")
disp(fp_1)
disp(fp_2)
disp(fp_3)
%to wartości z wzorów 7.16-7.18
disp("różnica w wynikach")
errors = [abs(fp_1 - ys_diff_from_func(1)), abs(fp_2 - ys_diff_from_func(2)), abs(fp_3 - ys_diff_from_func(3))],




