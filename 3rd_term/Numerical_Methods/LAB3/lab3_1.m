clear all
clc
close all
u = [1;2;3];
v = [4;5;6];
A = [1,2,3;4,5,6;7,8,9];
B = eye(3);
(u') * v  % iloczyn skalarany
u * (v.') % iloczyn wektorowy
v * (u.') % iloczyn wektorowy
A + B %dodawanie macierzy
A - B %odejmowanie macierzy
(u.')*A 
A * u 
4*A
(A+B) * u
inv(A) %macierz odwrotna
poly(A) % where A is an n-by-n matrix,
% returns the n+1 coefficients of the characteristic polynomial of the matrix, det(λI – A).
det(A) % dla tej macierzy A wychodzi 0, matlab wypisuje ~ 6,66 *10^(-16)
rank(A)
(u.')*A * u 
