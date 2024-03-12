clear all; 
close all;
clc;

N = 20; % Rozmiar macierzy
A = zeros(N); % Inicjalizacja macierzy A

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

% Sprawdzenie, czy wektory są ortonormalne, robi się tak po to żeby macierz
% robiła to co ma robić 
is_ortonormal = true; 
for i = 1:N
    for j = 1:N
        dot_product = A(i,:) * A(j,:)'; % Iloczyn skalarny
        if i == j && abs(dot_product - 1) > 1e-10 % Sprawdzenie elementów diagonalnych
            is_ortonormal = false;
            break;
        elseif i ~= j && abs(dot_product) > 1e-10 % Sprawdzenie elementów pozadiagonalnych
            is_ortonormal = false;
            break;
        end
    end
    if ~is_ortonormal
        break;
    end
end

% Wyświetlenie wyniku
if is_ortonormal
    disp('Macierz A jest ortonormalna.');
else
    disp('Macierz A nie jest ortonormalna.');
end
