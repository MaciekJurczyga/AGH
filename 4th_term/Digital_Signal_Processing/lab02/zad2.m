clear all
close all
clc
% Generowanie macierzy analizy A transformaty DCT-II
clear all;
close all;
clc;

N = 20;
n = 0:N-1;
k = 0:N-1;

s0 = sqrt(1/N);
sk = sqrt(2/N);

A = zeros(N, N);
for k = 0:N-1  %k = wiersze
    for n = 0:N-1 %n = kolumny
        if k == 0
            sk = sqrt(1/N);
        else
            sk = sqrt(2/N);
        end
        A(k+1, n+1) = sk * cos((pi * k * (2 * n + 1)) / (2 * N));
    end
end

% Generowanie macierzy odwrotnej S
S = A';

% Sprawdzenie, czy SA == I
identity_matrix = eye(N);
if abs(S * A - identity_matrix) < 1e-10
    disp('Wynik sprawdzenia SA==I: Macierz identycznościowa.');
else
    disp('Wynik sprawdzenia SA==I: Macierz nie jest identycznościowa.');
end

% Analiza i synteza sygnału losowego
x = randn(N, 1);
X = A * x;

% Rekonstrukcja sygnału
xs = S * X;

% Sprawdzenie, czy transformacja posiada właściwość perfekcyjnej rekonstrukcji
if abs(xs - x) < 1e-10
    disp('Wynik sprawdzenia xs==x: Transformacja posiada właściwość perfekcyjnej rekonstrukcji.');
else
    disp('Wynik sprawdzenia xs==x: Transformacja nie posiada właściwości perfekcyjnej rekonstrukcji.');
end

% Obliczenie błędu rekonstrukcji
reconstruction_error = norm(xs - x);

% Obliczenie błędu transformacji
transformation_error = norm(S * A - eye(N));
disp("syngał pierwotny:");
disp(x);
disp("sygnał po rekonstrukcji");
disp(xs);

disp(['Błąd rekonstrukcji: ', num2str(reconstruction_error)]);
disp(['Błąd transformacji: ', num2str(transformation_error)]);