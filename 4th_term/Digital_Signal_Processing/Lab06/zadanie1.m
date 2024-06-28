close all
clear all
clc

load("butter.mat")

fs = 16000;
fmin = 1189;
fmax = 1229;
wmin = 2*pi*fmin;
wmax = 2*pi*fmax;

[b,a] = zp2tf(z,p,k);


[num_d, den_d] = bilinear(b, a, fs);  % transofrmata bliniowa
N = 1024; % liczba punktów w charakterystyce
[H, w] = freqz(num_d, den_d, N, fs); %opdowiedź filtru cyfrowego
% Wykres charakterystyki amplitudowo-częstotliwościowej
figure;
plot(w, abs(H));
xlabel('Częstotliwość [rad/s]');
ylabel('Amplituda');
title('Charakterystyka amplitudowo-częstotliwościowa filtru cyfrowego');
grid on;
% Dodanie linii pionowych dla częstotliwości granicznych
hold on;
line([wmin, wmin], ylim, 'Color', 'r', 'LineStyle', '--');
line([wmax, wmax], ylim, 'Color', 'r', 'LineStyle', '--');
hold off; 


% Obliczenie charakterystyki amplitudowo-częstotliwościowej dla filtru analogowego
w = logspace(log10(wmin), log10(wmax), 1000); % równomiernie rozmieszczone częstotliwości w skali logarytmicznej
Hz = freqs(b, a, w);

% Wykres charakterystyki amplitudowo-częstotliwościowej filtru analogowego
figure;
semilogx(w, abs(Hz));
xlabel('Częstotliwość [rad/s]');
ylabel('Amplituda');
title('Charakterystyka amplitudowo-częstotliwościowa filtru analogowego');
grid on;
line([wmin, wmin], ylim, 'Color', 'r', 'LineStyle', '--');
line([wmax, wmax], ylim, 'Color', 'r', 'LineStyle', '--');
hold off; 


duration = 1; % czas trwania w sekundach
t = 0:1/fs:duration-1/fs; % wektor czasu

% Częstotliwości harmoniczne w hercach
f1 = 1209;
f2 = 1272;

% Generowanie sygnałów harmonicznych
signal1 = sin(2*pi*f1*t);
signal2 = sin(2*pi*f2*t);

% Sumowanie sygnałów
digital_signal = signal1 + signal2;


% Przefiltrowanie sygnału cyfrowego
filtered_signal = zeros(size(digital_signal)); % Inicjalizacja sygnału przefiltrowanego

% Konwolucja sygnału z odpowiedzią impulsową filtra
for n = 1:length(filtered_signal)
    for k = 1:length(num_d)
        if n-k+1 > 0
            filtered_signal(n) = filtered_signal(n) + num_d(k)*digital_signal(n-k+1);
        end
    end
    for k = 2:length(den_d)
        if n-k+1 > 0
            filtered_signal(n) = filtered_signal(n) - den_d(k)*filtered_signal(n-k+1);
        end
    end
end

% Wyświetlenie sygnału przefiltrowanego i oryginalnego
figure;
subplot(2,1,1);
plot(t, digital_signal);
xlabel('Czas [s]');
ylabel('Amplituda');
title('Sygnał cyfrowy złożony z dwóch harmonicznych (oryginalny)');
subplot(2,1,2);
plot(t, filtered_signal);
xlabel('Czas [s]');
ylabel('Amplituda');
title('Sygnał cyfrowy po filtracji ( własny filtr )');


% Przefiltrowanie sygnału cyfrowego
filtered_signal = filter(num_d, den_d, digital_signal);

% Wyświetlenie sygnału przefiltrowanego i oryginalnego
figure;
subplot(2,1,1);
plot(t, digital_signal);
xlabel('Czas [s]');
ylabel('Amplituda');
title('Sygnał cyfrowy złożony z dwóch harmonicznych (oryginalny)');
subplot(2,1,2);
plot(t, filtered_signal);
xlabel('Czas [s]');
ylabel('Amplituda');
title('Sygnał cyfrowy po filtracji');




