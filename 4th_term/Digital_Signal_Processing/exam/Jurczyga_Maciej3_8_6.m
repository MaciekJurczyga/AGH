% Wczytanie pliku dźwiękowego
[y, fs] = audioread('mowa8000.wav');

% Dodanie zakłócenia sinusoidalnego o częstotliwości 1500 Hz
f0 = 1500; % Częstotliwość zakłócenia
t = (0:length(y)-1)'/fs;
noise = 0.5 * sin(2 * pi * f0 * t);
y_noisy = y + noise;

% Odsłuchanie sygnału z zakłóceniem
disp('Odsłuchanie sygnału z zakłóceniem sinusoidalnym...');
sound(y_noisy, fs);
pause(length(y) / fs + 1);

% Parametry filtra analogowego typu notch
f0 = 1500; % Częstotliwość środkowa filtra
bw = 10000; % Szerokość pasma
Q = f0 / bw; % Współczynnik jakości

% Projektowanie filtra analogowego typu notch
omega_0 = 2 * pi * f0;
B = [1, 0, omega_0^2];
A = [1, omega_0 / Q, omega_0^2];

% Transformacja biliniowa do z domeny
fs2 = 2 * fs;
b0 = fs2^2 + B(3);
b1 = -2 * (fs2^2 - B(3));
b2 = fs2^2 + B(3);
a0 = fs2^2 + A(2) * fs2 + A(3);
a1 = -2 * (fs2^2 - A(3));
a2 = fs2^2 - A(2) * fs2 + A(3);

b = [b0, b1, b2] / a0;
a = [a0, a1, a2] / a0;


% Filtracja sygnału z zakłóceniem sinusoidalnym
filtered_signal = filter(b, a, y_noisy);

% Odsłuchanie przefiltrowanego sygnału
disp('Odsłuchanie przefiltrowanego sygnału sinusoidalnego...');
sound(filtered_signal, fs);
pause(length(y) / fs + 1);

% Dodanie zakłócenia z sinusoidalną modulacją częstotliwości (SFM)
df = 250; % Głębokość modulacji
fm = 0.25; % Częstotliwość modulująca
noise_sfm = 0.5 * sin(2 * pi * (f0 + df * sin(2 * pi * fm * t)) .* t);
y_noisy_sfm = y + noise_sfm;

% Odsłuchanie sygnału z zakłóceniem SFM
disp('Odsłuchanie sygnału z zakłóceniem SFM...');
sound(y_noisy_sfm, fs);
pause(length(y) / fs + 1);

% Filtracja zakłócenia SFM za pomocą kilku filtrów notch
filtered_signal_sfm = y_noisy_sfm;
frequencies = [f0 - df, f0, f0 + df];

for f = frequencies
    omega_0 = 2 * pi * f;
    B = [1, 0, omega_0^2];
    A = [1, omega_0 / Q, omega_0^2];
    
    % Transformacja biliniowa
    b0 = fs2^2 + B(3);
    b1 = -2 * (fs2^2 - B(3));
    b2 = fs2^2 + B(3);
    a0 = fs2^2 + A(2) * fs2 + A(3);
    a1 = -2 * (fs2^2 - A(3));
    a2 = fs2^2 - A(2) * fs2 + A(3);

    b = [b0, b1, b2] / a0;
    a = [a0, a1, a2] / a0;
    
    filtered_signal_sfm = filter(b, a, filtered_signal_sfm);
end

% Odsłuchanie przefiltrowanego sygnału SFM
disp('Odsłuchanie przefiltrowanego sygnału SFM...');
sound(filtered_signal_sfm, fs);
pause(length(y) / fs + 1);

% Wykresy sygnałów przed i po filtracji
figure;
subplot(3,1,1);
plot(t, y);
title('Oryginalny sygnał');
xlabel('Czas [s]');
ylabel('Amplituda');

subplot(3,1,2);
plot(t, y_noisy);
title('Sygnał z zakłóceniem sinusoidalnym');
xlabel('Czas [s]');
ylabel('Amplituda');

subplot(3,1,3);
plot(t, filtered_signal);
title('Przefiltrowany sygnał sinusoidalny');
xlabel('Czas [s]');
ylabel('Amplituda');

figure;
subplot(3,1,1);
plot(t, y);
title('Oryginalny sygnał');
xlabel('Czas [s]');
ylabel('Amplituda');

subplot(3,1,2);
plot(t, y_noisy_sfm);
title('Sygnał z zakłóceniem SFM');
xlabel('Czas [s]');
ylabel('Amplituda');

subplot(3,1,3);
plot(t, filtered_signal_sfm);
title('Przefiltrowany sygnał SFM');
xlabel('Czas [s]');
ylabel('Amplituda');
