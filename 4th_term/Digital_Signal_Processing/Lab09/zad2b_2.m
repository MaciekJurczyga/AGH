% Lab 9, zadanie 2b - Kasowanie echa
clear all; close all;
%% £adowanie sygna³ów
[sA,fs1]=audioread('mowa_1.wav');   %glos A - niemo¿liwy do zarejestrowania, referencja
[sB,fs2]=audioread('mowa_2.wav');   %glos B
[sAG,fs3]=audioread('mowa_3.wav');  %glos osoby A zaszumiony g³osem B
sA = sA';
aB = sB';
sAG = sAG';
d = sAG; %Osoba B "zaszumiona" A
x = sB; %Osoba B
dref = sA;%Osoba A

%% Budowa filtra 
M = 7; %18 % d³ugoœæ filtru
mi = 0.5;%0.275 % wspó³czynnik szybkoœci adaptacji
snrMAX = 0;
Mbest = 0
miBest = 0;
for M = 1:100
    for mi = 0.01:0.05:0.5

        y = []; e = []; % sygna³y wyjœciowe z filtra
        bx = zeros(M,1); % bufor na próbki wejœciowe x
        h = zeros(M,1); % pocz¹tkowe (puste) wagi filtru

        %% Filtracja 
        for n = 1 : length(x)
            bx = [ x(n); bx(1:M-1) ]; % pobierz now¹ próbkê x[n] do bufora
            y(n) = h' * bx; % oblicz y[n] = sum( x .* bx) – filtr FIR
            e(n) = d(n) - y(n); % oblicz e[n]
            h = h + mi * e(n) * bx; % LMS
            % h = h + mi * e(n) * bx /(bx'*bx); % NLMS
        end
        %Y - sygna³ osoby B
        %E - sygna³ osoby a
        %% SNR
        SNR = 10*log10(sum(dref .* dref)/sum((dref - e) .^ 2));
        
        if SNR > snrMAX 
           snrMAX = SNR;
           Mbest = M;
           miBest = mi;
        end
    end
end
Mbest
mi
%% odsluch po przejsciu przez filtr
% soundsc(e,fs1) %e - sygnal odszumiony a
% pause;
% soundsc(sA, fs1); pause;
% soundsc(sB, fs2); pause;
% soundsc(sAG, fs3);

%% Wykres sygna³ów
figure
plot(dref)
hold on;
plot(d)
plot(e, '--')
grid;
xlabel('Czas')'
ylabel('Amplituda')
legend('Referencyjny', 'Osoba B "zaszumiona" A', 'Odzyskane A')
