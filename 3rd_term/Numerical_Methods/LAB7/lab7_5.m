clear all
close all
clc
% diff_cps.m
clear all; close all;
K = 5; % liczba wezlow/wag filtra
w = 0 : pi/100 : pi;
d1=1/12*[-1 8 0 -8 1],
% d1 = [-0.0833 0.6667 0-0.6667 0.0833 ]
d2=firls(K-1,[0 0.5 0.7 1],[0 0.5*pi 0 0],'differentiator'),
%d2 = [-0.0890 0.6862 0-0.6862 0.0890 ]
d3=firpm(K-1,[0 0.5 0.7 1],[0 0.5*pi 0 0],'differentiator'),
d3 = [-0.0295 0.6474 0 -0.6474 0.0295 ],
figure(1)
plot( 0:0.01:0.5, 0:0.01:0.5,'k.', ...
w/pi, abs(freqz(d1,1,w))/pi,'b-', ...
w/pi, abs(freqz(d2,1,w))/pi,'r--', ...
w/pi, abs(freqz(d3,1,w))/pi,'m-.');
xlabel('f/fnorm'); title('|D1(fnorm)|'); grid;
legend('REF','DIFF','LS','MIN-MAX');


K = 25; % liczba wezlow/wag filtra
w = 0 : pi/100 : pi;
d1=1/12*[-1 8 0 -8 1],
% d1 = [-0.0833 0.6667 0-0.6667 0.0833 ]
d2=firls(K-1,[0 0.5 0.7 1],[0 0.5*pi 0 0],'differentiator'),
%d2 = [-0.0890 0.6862 0-0.6862 0.0890 ]
d3 = firpm(K-1,[0 0.5 0.7 1],[0 0.5*pi 0 0],'differentiator'),
%d3 = [-0.0295 0.6474 0 -0.6474 0.0295 ], 
figure(2)
plot( 0:0.01:0.5, 0:0.01:0.5,'k.', ...
w/pi, abs(freqz(d1,1,w))/pi,'b-', ...
w/pi, abs(freqz(d2,1,w))/pi,'r--', ...
w/pi, abs(freqz(d3,1,w))/pi,'m-.');
xlabel('f/fnorm'); title('|D2(fnorm)|'); grid;
legend('REF','DIFF','LS','MIN-MAX');

%{
 zwieksząjąc ka otrzymujemy lepsze przybliżenie do prostej 
 tzn lepsze upodobnienie do filtra idealnego :)

h = firls(n, f, a)
n to stopień filtra FIR,
f to wektor punktów częstotliwości, w których określone są wartości charakterystyki amplitudowej,
a to wektor wartości charakterystyki amplitudowej w punktach częstotliwości.
filtrów przy użyciu metody najmniejszych kwadratów (LS). 
Metoda ta minimalizuje różnicę pomiędzy żądaną charakterystyką amplitudową a rzeczywistą charakterystyką amplitudową filtru FIR.

h = firpm(n, f, a) 
n to stopień filtra FIR,
f to wektor punktów częstotliwości, w których określone są wartości charakterystyki amplitudowej,
a to wektor wartości charakterystyki amplitudowej w punktach częstotliwości.
filtrów przy użyciu metody minimalizacji błędu maksymalnego pasma przepustowego 


%}