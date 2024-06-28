clear all;
close all;
clc;
points = 4096;
N = 4;
mid_freq_unscaled = 96;
mid_freq = 2 * pi * 1e6 * mid_freq_unscaled;
tollerance_unscaled = 50;
tollerance = 2 * pi * 1e3 * tollerance_unscaled;
w = linspace(mid_freq - 2 * tollerance, mid_freq + 2 * tollerance, points);
[ze, pe, ke] = ellip(N, 3, 40, [mid_freq - tollerance, mid_freq + tollerance], 's');
[be, ae] = zp2tf(ze, pe, ke);
he = freqs(be, ae, w);

% Odpowiedzi częstotliwościowe
plot(w / (2e6 * pi), mag2db(abs(he)));
axis([mid_freq_unscaled - 2 * tollerance_unscaled / 1e3, mid_freq_unscaled + 2 * tollerance_unscaled / 1e3, -45, 5]);
grid;
title("Odpowiedź częstotliwościowa");
xlabel("Częstotliwość (MHz)");
ylabel("Odpowiedź (dB)");

% Dodanie pionowych kresek
hold on;
line([95.95 95.95],[5 -90],'LineWidth',0.1,'Visible',true,'Color','red');
line([96.05 96.05],[5 -90],'LineWidth',0.1,'Visible',true,'Color','red');

