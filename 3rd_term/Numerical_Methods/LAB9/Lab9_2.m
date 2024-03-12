clear all
close all
clc


it = 14;
a = pi-pi/5; b=pi+pi/5; % znajdz zero funkcji y=sin(x) dla x=pi
f = @(x) sin(x); % definicja funkcji
fp = @(x) cos(x); % definicja pochodnej funkcji
x = 0 : 0.01 : 2*pi;
plot( x, f(x), 'b-', x, fp(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
legend('Funkcja’,’Jej pochodna'); pause
cb = nonlinsolvers( f, fp, a, b, 'bisection', it );
%cr = nonlinsolvers( f, fp, a, b, 'regula-falsi', it);
%cn = nonlinsolvers( f, fp, a, b, 'newton-raphson', it);
plot( 1:it,cb,'o-'); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection')
%wartości pi + 0,0001*pi = 3,1416