clear all
close all
clc
% A· x = (L·U) · x = L· (U· x) = b => L * y = b : y = U*X
A = [2,-1,0,1;
    -1,2,-1,2;
    0,-1,2,1;
    2,-1,-1,0;];
b = [1;4;5;2];

[N, N] = size(A);
[L, U] = lu(A);
y(1,1)=b(1);
for i=2:N
    y(i,1) = b(i)- L(i,1:i-1)*y(1:i-1,1);
end

x(N,1)=y(N)/U(N,N);

for i=N-1:-1:1
    x(i,1) = (1/U(i,i)) * ( y(i) - U(i,i+1:N)*x(i+1:N,1) );
end
A*x
x

