% evd_jacobi.m
clear all;
close all;
clc; 

A = [ 2 0 1; 
    0 -2 0 ; 
    1 0 2 ]; % przyklad z Yang, 2005
[R, D] = solve(A)

A = [1 2 3 4;
    2 3 4 5;
    3 4 5 6;
    4 5 6 7;]
[R, D] = solve(A)
[V1, D1] = eig(A);
D1

%{

Ta funkcja solve przyjmuje symetryczną macierz A i zwraca macierze R (zawierającą informacje o transformacjach)
i D (diagonalną macierz, która jest przybliżeniem wartości własnych macierzy A).
Wewnątrz funkcji solve zachodzi iteracyjne zerowanie elementów poza diagonalą macierzy D.
Wykorzystywane są tutaj rotacje zerujące, które są wykonywane za pomocą funkcji makeRi.

Ta funkcja generuje macierz rotacji zerującej Ri, która jest używana do
zerowania elementu A(p, q) w macierzy A. z wzorów 8.45 - 8.48 dla największych wartości bezwzględnych

Iteracje kontynuują się, dopóki wartość bezwzględna elementu spoza diagonalnej macierzy D jest większa niż wartość progowa (0.00000000001).

Na koniec program wyświetla macierz rotacji R i diagonalną macierz D, które są przybliżeniem wartości własnych macierzy A.

%} 

function [R, D] = solve(A)
   D = A;
   [N, N] = size(D);
   R = eye(N);
   while (1)
       Dabs = abs(D - tril(D)); %macierz symetryczna, rozpoatrujemy górny trójkąt macierzy, co ważne bez wartosci na ortagonalnych
       [v, x, y] = mmax(Dabs);
       assert(Dabs(y, x) == v); %throws error if condition false
      
       if (abs(v) > 0.00000000001) % głowne założenie pętli, jak wartośc macierzy poza diagonalna będzie poniżej jej, dostatecznie bliska zeru, pętla przerywana
           Ri = makeRi(y, x, D);
           D = Ri.' * D * Ri;
           R = R * Ri;
       else
           return
       end
   end
end
function [v, x, y] = mmax(A)
   [N, N] = size(A);
   [v, i] = max(A, [], 'all'); %maximum over all elements in A
   % 'i' to jest numer elementu licząc kolumnami
   x = fix(i / N) + 1; %dzielenie całkowite 
   y = rem(i, N); %reszta z z dzielenia i przez N daje indeks kolumny
   if (x == 0)
       % this is the last element of a row
       y = N;
       x = x - 1;
       return
   end
end
function [Ri] = makeRi(p, q, A)
   xi = (A(q,q) - A(p,p)) / 2 / A(p,q);
   if( xi > -eps ) %eps bardzo mały, zagrywka często stosowana w met num w celu uniknięcia błedow
       t =  (abs(xi) + sqrt(1 + xi^2));
   else
       t = -(abs(xi) + sqrt(1 + xi^2));
   end
  
   c = 1 / sqrt(1+t^2);
   s = t * c;
   [N, N] = size(A);
   Ri = eye(N);
   Ri(p, p) = c;
   Ri(q, q) = c;
   Ri(p, q) = -s;
   Ri(q, p) = s;
end
