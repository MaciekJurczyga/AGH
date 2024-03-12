clear all; close all;
N = 1000;

% ... Twój kod definicji macierzy S ...

figure;

subplot(2, 3, 1);
title('S1');
x = elipsa(S1, 1, N);
plot(x(1,:), x(2,:), 'ro'); grid; hold on;
plot(x(1,:) .* (2*(rand(1,N)-0.5)), x(2,:), 'b*');
xlabel('x'); ylabel('y'); axis square;

% ... Powtórz to dla innych macierzy S ...

subplot(2, 3, 2);
title('S2');
x = elipsa(S2, 1, N);
plot(x(1,:), x(2,:), 'ro'); grid; hold on;
plot(x(1,:) .* (2*(rand(1,N)-0.5)), x(2,:), 'b*');
xlabel('x'); ylabel('y'); axis square;

% ... Kontynuuj dla pozostałych macierzy ...

sgtitle('Circle/Ellipse Comparison');

function x = elipsa(S, r, N)
    [V, D] = eig(S); % EVD
    V = V * sqrt(r * D); % Macierz transformacji y (okrąg) --> x (elipsa)
    alfa = linspace(0, 2*pi, N); % Kąty okręgu
    x = V * [cos(alfa); sin(alfa)]; % Transformacja punktów okręgu na elipsę
end