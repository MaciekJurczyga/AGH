clear all
close all
clc

[audio, fs] = audioread('audio_zad2.mp3');

% dźwięk oryginalny
sound(audio, fs);
pause; 


% Parametry
fpr = 8000; % częstotliwość próbkowania
audio_resampled = resample(audio, fpr, fs); % resampling do 8 kHz

% x1 - oryginał: 800 zer na końcu, pomnożony razy 1/2
x1 = [audio_resampled; zeros(800, 1)] * 0.5;

% x2 - opóźniona kopia #1: początek i koniec dodajemy 400 zer, mnożymy razy
% 0.25
x2 = [zeros(400, 1); audio_resampled; zeros(400, 1)] * 0.25;

% x3 - opóźniona kopia #2: początek dodajemy 800 zerm mnożymy razy 0.125
x3 = [zeros(800, 1); audio_resampled] * 0.125;

% Dodajemy trzy sygnały
x123 = x1 + x2 + x3;

% wywołanie z parametrów na sztywno
sound(x123, fpr);
pause;

% użycie elastycznej funckji
delays = [0, 800, 1600, 2400, 3200,];
amplitudes = [0.5, 0.3, 0.2, 0.1, 0.05];
xall = zad2_9_function(audio, fs, delays, amplitudes);
sound(xall, fpr);  

% Wykresy sygnałów
t_audio = (0:length(audio)-1) / fs;
t_x123 = (0:length(x123)-1) / fpr;
t_xall = (0:length(xall)-1) / fpr;

figure;

% Wykres sygnału oryginalnego
subplot(3,1,1);
plot(t_audio, audio);
title('Sygnał oryginalny');
xlabel('Czas [s]');
ylabel('Amplituda');
xlim([0, length(audio)/fs]);

% Wykres sygnału x123
subplot(3,1,2);
plot(t_x123, x123);
title('Sygnał x123');
xlabel('Czas [s]');
ylabel('Amplituda');
xlim([0, length(x123)/fpr]);

% Wykres sygnału xall
subplot(3,1,3);
plot(t_xall, xall);
title('Sygnał xall');
xlabel('Czas [s]');
ylabel('Amplituda');
xlim([0, length(xall)/fpr]);


