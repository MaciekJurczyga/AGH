clear all
close all
clc
% A*x = b, x=?
A = [ 1 2; ...
3 4 ];
b = [ 5; ...
11 ];
x1 = inv(A)*b; % x=A^(-1)*b
x2 = A\b; % optymalne rozwiazywanie rown. Ax=b
x3 = pinv(A)*b; % x = inv( A;*A ) * A’ * b , sprawdzisz?
bhat = A*x1; % sprawdzenie
err = max(abs(x1-x2)); % blad
% ODWRACANIE MACIERZY RZĘDU 2

A_odw = odwr_rzad2(A);
if A_odw == 0
    disp("wyznacznik macierzy A równy 0")
else
   A_check = odwr_rzad2(A_odw); % odwracanie 2 razy tej samej macierzy powinno dać macież wyjściową
   if (A == A_check)
       disp("odwrócenie poprawne maicerzy 2x2")
   end
end 
% ODWRACANIE MACIERZY RZĘDU 3
B = [1,2,5;
    7,4,5;
    5,11,7;]
B_odwr = odwr_rzad3(B)
B_check = odwr_rzad3(B_odwr)
err = max(abs(B-B_check))
% REKURENCYJNA FUNCKJA

C = [6, 2, 5, 4; 
    3, 4, 5, 8;
    4, 12, 3, 1;
    9, 5, 6, 13;];
N = size(C);

Z = zeros(N(1), N(1));
C_odwr = odwrot_recursive(C, N(1), N(1), N(1), Z);
C_check = odwrot_recursive(C_odwr, N(1), N(1), N(1), Z);
C_odwr
C_check









