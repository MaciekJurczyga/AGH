clear all
close all
clc 

% Parametry
new_fpr = 40000;  % Nowa częstotliwość próbkowania


% Wczytanie pliku audio
[audio, fpr] = audioread('audio_zad1.mp3');
%audio = audio(:, 1); % Jeśli plik jest stereo, wybierz pierwszy kanał

% Przeskalowanie częstotliwości próbkowania do nowej wartości
audio_resampled = resample(audio, new_fpr, fpr);

% odsłuch oryginalnej wiadomości
sound(audio_resampled, new_fpr);
pause;

% Wyświetlenie częstotliwości próbkowania
disp(['Oryginalna częstotliwość próbkowania: ' num2str(fpr) ' Hz']);
disp(['Nowa częstotliwość próbkowania: ' num2str(new_fpr) ' Hz']);

% Obliczenie długości nagrania w sekundach
audioLengthInSeconds = length(audio_resampled) / new_fpr;
disp(['Długość nagrania: ' num2str(audioLengthInSeconds) ' sekund']);

% Wyświetlenie oryginalnego sygnału
n = length(audio_resampled); % Określa długość nagranego sygnału dźwiękowego
t = (0:n-1)/new_fpr; % Tworzy wektor czasu dla osi X, dzieląc indeksy próbek przez nową częstotliwość próbkowania
figure;
plot(t, audio_resampled);
title('Nagrany dźwięk');
xlabel('Czas [s]');
ylabel('Amplituda');

% Podział na słowa - wskaźniki w sekundach
startTimes = [0.57, 1.35, 1.65, 2.07, 2.94, 4.02, 4.49, 5.17, 5.44, 6.03, 7.03, 8, 8.74, 9.6, 9.88,  10.4 ]; 
endTimes =   [1.21, 1.59, 1.87, 2.64, 3.78, 4.35, 5.14, 5.36, 5.85, 6.68, 7.9, 8.6, 9.2, 9.87, 10.3, 11 ]; 

% Konwersja wskaźników czasowych na wskaźniki próbek
startIdx = round(startTimes * new_fpr);
endIdx = round(endTimes * new_fpr);

% Sprawdzenie, czy wskaźniki są poprawne
assert(all(endIdx <= length(audio_resampled)), 'Wskaźniki końcowe wykraczają poza długość nagrania.');

words = cell(1, length(startIdx)); % Tworzy komórkową tablicę na przechowanie wyodrębnionych słów
for i = 1:length(startIdx) % Iteruje przez wskaźniki początkowe słów
    words{i} = audio_resampled(startIdx(i):endIdx(i)); % Wyodrębnia fragmenty dźwięku (słowa) i zapisuje je w komórkowej tablicy
end

% Zmiana kolejności słów - stała kolejność
newOrder = [16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]; % Przykładowa nowa kolejność słów
rearrangedAudio = [];

for i = 1:length(newOrder) % Iteruje przez nową kolejność słów
    rearrangedAudio = [rearrangedAudio; words{newOrder(i)}]; % Dodaje wybrane słowa w nowej kolejności do wektora rearrangedAudio
end

% Odtworzenie wynikowego dźwięku
sound(rearrangedAudio, new_fpr);

% Wyświetlenie długości zmienionego dźwięku
disp(['Długość zmienionego dźwięku: ' num2str(length(rearrangedAudio)/new_fpr) ' sekund']);

% Wyświetlenie wynikowego dźwięku
n = length(rearrangedAudio);
t = (0:n-1)/new_fpr;
figure;
plot(t, rearrangedAudio);
title('Zmieniony dźwięk');
xlabel('Czas [s]');
ylabel('Amplituda');
