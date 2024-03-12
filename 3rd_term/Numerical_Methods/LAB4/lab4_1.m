clear all
close all
clc
% sprawdzenie dla N > 3
A = [2,-1,0,1;
    -1,2,-1,2;
    0,-1,2,1;
    2,-1,-1,0;];
[L,U] = myLU(A);

Ahar = L * U
[L_m, U_m] = lu(A);
L_m * U_m
L
L_m
U_m
U
