clear all 
close all
clc
A = [1,2,3;
    2,8,10;
    3,10,22;]
[L, U] = choles(A);
A_check = L * U
U_matlab = chol(A);
L_matlab = U.';
A_check_matlab = L_matlab * U_matlab
display("L i U z własnego algorytmu")
L
U
display("L i U z algorytmu z matlaba")
L_matlab
U_matlab