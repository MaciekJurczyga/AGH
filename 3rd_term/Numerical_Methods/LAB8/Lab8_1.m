% Separacja źródeł - nagrania
clear all; close all;

% Wczytanie nagrania z dwóch mikrofonów
[y1, fpr1] = audioread('mix1.wav'); y1 = y1(:, 1)'; 
[y2, fpr2] = audioread('mix2.wav'); y2 = y2(:, 1)'; 

% Pokazanie wymiarów wektorów
size(y1), size(y2), pause 

% Określenie długości krótszego nagrania
N = min(length(y1), length(y2)); 

% Pozostawienie takiej samej liczby próbek dla obu nagrań
n = 1:N; y1 = y1(1:N); y2 = y2(1:N); 

% Wyświetlenie obu nagrań
figure;
subplot(211); plot(n, y1); title('y1(n)'); grid;
subplot(212); plot(n, y2); title('y2(n)'); grid;
soundsc(y1(1:7*fpr1), fpr1), pause 
soundsc(y2(1:3*fpr2), fpr2), pause 

% Separacja źródeł
C1 = cov(y1, y2); % Macierz kowariancji w Matlaba
y12 = [y1 - mean(y1); y2 - mean(y2)]; % Odjęcie wartości średnich
C2 = y12 * y12' / N; % Nasza macierz kowariancji
pause

C = C2; % Możesz wybrać C = C1 albo C2

% Dekompozycja EVD
[V, D] = eig(C); 

pause 

% PCA - rzutowanie na wektory własne
xe = V' * [y1; y2]; %uzyskanie nowych, osobnych sygnałów.

% Wynik separacji
figure;
subplot(211); plot(n, xe(1,:), 'b'); title('x1est(n)'); grid;
subplot(212); plot(n, xe(2,:), 'b'); title('x2est(n)'); grid;
soundsc(xe(1,:), fpr1), pause
soundsc(xe(2,:), fpr2), pause
%macierz kowariancji jest używana do analizy statystycznych zależności między sygnałami, 
% a dekompozycja EVD pozwala uzyskać wektory własne, które reprezentują kierunki maksymalnej 
% wariancji. Rzutowanie na te wektory własne za pomocą PCA prowadzi do uzyskania zróżnicjonych
% sygnałów, co przyczynia się do separacji źródeł dźwięku.