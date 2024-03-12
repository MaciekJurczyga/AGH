clear all;
close all;
clc;
% W wyniku pomiaru otrzymano nastepujace liczby ( x = numer pomiaru, y = wartosc )

%x = [ 1 2 3 4 5 6 7 8 9 10];
%y = [ 0.912 0.945 0.978 0.997 1.013 1.035 1.057 1.062 1.082 1.097];

x = [ 1 2 3 4 5 6 7 ];
y = [ 0.912 0.945 0.978 1.297 1.013 1.035 1.057];

figure; plot( x, y, 'b*' ); title('y=f(x)'); grid;
% Aproksymacja linia prosta: y = a * x + b
if(0) % OGOLNIE - rozwiazanie rownania macierzowego
    xt = x'; yt = y'; N = length( xt ); % X * ab
    X = [ xt, ones(N,1) ]; % y(n) = a*x(n) + b = | x(1) 1 | * | a |
    ab = X \ yt; % y(1) = a*x(1) + b = | x(2) 1 | | b |
    a = ab(1), b = ab(2), % y(2) = a*x(2) + b = | x(3) 1 |
else % W TYM PRZYPADKU - na podstawie wyprowadzonych wzorow
    xm = mean( x ); % srednia wartosc wektora x
    ym = mean( y ); % srednia wartosc wektora y
    xr = x - xm; % wektor x - srednia x (od kazdego elementu)
    yr = y - ym; % wektor y - srednia y (od kazdego elementu)
    a = (xr * yr') / (xr * xr') % obliczenie wsp a prostej, to samo
    % inaczej: a = sum( xr .* yr ) / sum( xr .* xr )
    b = ym - a * xm % obliczenie wsp b prostej
end
figure; plot( x, y, 'b*', x, a*x+b, 'k-' ); title('y=f(x)'); grid;
% Takze wielomiany wyzszych rzedow
p = polyfit(x,y,1);
figure; plot( x, y, 'b*', x, polyval(p,x), 'r-' ); title('Stopień wielomianu: 1'); grid;
figure;
p1 = polyfit( x, y, 2 ), % a=p(1), b=p(2)
subplot(221); plot( x, y, 'b*', x, polyval(p1,x), 'r-' ); title('Stopień wielomianu: 2'); grid;
p2 = polyfit( x, y, 3 ), % a=p(1), b=p(2)
subplot(222); plot( x, y, 'b*', x, polyval(p2,x), 'r-' ); title('Stopień wielomianu: 3'); grid;
p3 = polyfit( x, y, 4 ), % a=p(1), b=p(2)
subplot(223); plot( x, y, 'b*', x, polyval(p3,x), 'r-' ); title('Stopień wielomianu: 4'); grid;
p4 = polyfit( x, y, 5 ), % a=p(1), b=p(2)
subplot(224); plot( x, y, 'b*', x, polyval(p4,x), 'r-' ); title('Stopień wielomianu: 5'); grid;
