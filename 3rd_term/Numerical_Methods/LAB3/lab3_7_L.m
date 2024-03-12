                                                                                                        clear all;
clc;
close all;
% matrix_transform.m

% Dane wejsciowe
[x,fpr]=audioread('mowa.wav',[1,2^14]);
N = length(x);
figure; plot(x); title('x(n)');
% Transformacja liniowa/ortogonalna - ANALIZA
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
%x = A(500,:) + A(1000,:); x = x';

y = A*x;
figure; plot(y); title('y(k)');
% Modyfikacja wyniku
%y(N/8+1:N,1) = zeros(7*N/8,1) %usuwamy wysokie częstotliwości 
%y(2*N/8:6*N/8,1) = zeros(4*N/8+1,1); % "srodkowy przedzial <4096, 12 228>
%y(1:N/8,1) = zeros(1*N/8,1); %uuswamy niskie częstotliwości

%y(1000)=0;
figure; plot(y); title('y(k) po mod');
% Transformacja odwrotna - SYNTEZA
xback = A'*y;
figure; plot(xback); 
title('xback(n)');
soundsc(x,fpr); pause
soundsc(xback,fpr);





