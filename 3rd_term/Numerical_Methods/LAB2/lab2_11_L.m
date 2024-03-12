clear all
clc
% • unikamy odejmowania liczb o zblizonych warto ˙ sciach, ´
% • staramy si˛e dodawac liczby o zbli ´ zonych warto ˙ sciach, ´
% • staramy si˛e, aby wyniki przejsciowe były bliskie jedynki, np. mno ´ zymy liczby ˙
% małe i duze, dzielimy podobne, ˙
% • wielokrotne dodawanie rozpoczynamy od liczb najmniejszych,
% • zmniejszamy liczb˛e operacji, np. y(x) = a1 ∗ x
% 3 +a2 ∗ x
% 2 +a3 ∗ x
% 1 +a4 = a4 +x ∗
% (a3 +x ∗ (a2 +a1 ∗ x)).
% • unikamy funkcji rekurencyjnych (zagniezd˙ zonych), stosujemy rozwi ˛azania itera- ˙
% cyjne,
% • stosujemy obliczenia wektorowe, zamiast p˛etli, jesli jest to mo ´ zliwe (SIMD - ˙ Single Instruction Multiple Data, MIMD - Multiple Instruction Multiple Data),
% • oczywiscie staramy si˛e unika ´ c bł˛edów wykonania, np. dzielenia przez zero. 
disp('CASE 1')

x = 10^(-50);
y = 10^(200);
z = 10^(300);
(x*y)/z     % dla bardzo różnych wartosci bezwględnych x y wynik dobry, więc kolejność działań
            % jest dobra. Mnożymy liczbę małą przez dużą
disp('CASE 2')

x = 10.01^(-200);
y = 10.02^(200);
z = (10)^(-180);
x*(y/z),    % błąd, ponieważ dzielimy liczby o bardzo różnych wartośćiach  
(x*y)/z,    % ok, ponieważ mnożymy liczby o bardzo różnych wartościach
(x/z)*y,    % ok, ponieważ dzielimy liczby o zbliżonych wartościach 
disp('CASE 3')

x = 10^(200);
y = 10^(230);
z = 10^(180);
x*(y/z),    
(x*y)/z,     % możymy dwie duże liczby - błąd 




