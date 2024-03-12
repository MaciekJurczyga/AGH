clear all
close all
clc
N = 2^13;
[canary, canary_fpr] = audioread('Canary.wav', [1,N]);
[elephant, elephant_fpr]= audioread('elephnt.wav', [1,N]);
%wykresy dźwięku od czasu
figure; plot(canary); title('canary');
figure; plot(elephant); title('elephant');
combined = canary + elephant;
%widma
n = 0:N-1; k = 0:N-1;
A = sqrt(2/N)*cos(pi/N *(k'*n));
canary_spectrum = A * canary;
elephant_spectrum = A * elephant;
figure; plot(canary_spectrum); title('canary_spectrum');
figure; plot(elephant_spectrum); title('elephant_spectrum')
combined_spectrum = A * combined;
% odtwarzanie
canary_restored_spectrum = combined_spectrum - elephant_spectrum;
canary_restored = A^(-1) * canary_restored_spectrum;
figure; plot(canary_restored); title('canary_restored')
soundsc(elephant, elephant_fpr); pause
soundsc(canary, canary_fpr); pause
soundsc(combined, elephant_fpr); pause
soundsc(canary_restored, canary_fpr); 







