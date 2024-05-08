close all; 
clear all;

%% DANE z instrukcji
fs  = 8000;     %czestotliwosc probkowania
t = 0:1/fs:1;
A1 = -0.5;      %amplitudy zadane
A2 = 1;
f1 = 34.2;
f2 = 115.5;

%% sygnal czysty do porownania - referencyjny
dref = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t);
%filtry adaptayjne - w œrodku odejmujemy i wynik traktujemy jako ten b³¹d,
%co powoduje przestrajanie filtra ¿eby skasowaæ ró¿nicê (minimalizowaæ)=>
%upodobnienie y do y-referencyjnego
%% awgn 10dB
d = awgn(dref, 10, 'measured'); 
%dref, snr (im mniejszy snr tym wiekszy szum i bardziej 'postrzêpione), bo
%to w koñcu moc sygna³u do szumu
x = [ d(1) d(1:end-1) ];    %sygna³ filtrowany - opóŸniony
M = 90;                    
%d³ugoœci filtru metod¹ prób i b³êdów - zapamiêtujemy wiêcej lub mniej
%próbek ¿eby przewidzieæ kolejne - wiêc teoretycznie dok³adnoœæ - natomiast
%bêdzie potrzebowa³ wiêcej czasu ¿eby siê dopasowaæ (ale dopasowanie bêdzie
%git)
mi = 0.01;
%wspó³czynnik szybkoœci adaptacji, bo jak szybko to przestaje sie w pewnym
%momencnie adaptowaæ do sygna³u, a zaczyna do szumu, a zbyt wolno to nie
%zd¹¿y :( im mi mniejsze to zmiany bêd¹ mniejsze wiêc sie bedzie filtr
%wolniej zmienia³, e(n) to b³¹d, wiêc skoro dok³adnie siê uda³o to nie
%zmieniamy wtedy h ; bx - sygna³ wejœciowy
y = []; e = [];     %sygna³y wyjœciowe z filtra
bx = zeros(M,1);    %bufor na próbki sygna³u wejœciowego
h = zeros(M,1);     %pocz¹tkowe (puste) wagi filtru

for n = 1 : length(x)
    bx = [ x(n); bx(1:M-1) ];   %pobierz nowe próbki x[n] do bufora
    y(n) = h' * bx;             %oblicz y[n] = sum( x .* bx) ? filtr FIR
    e(n) = d(n) - y(n);         %oblicz e[n]
    h = h + mi * e(n) * bx;     %LMS
    % h = h + mi * e(n) * bx /(bx'*bx); % NLMS
end

%% awgn 20dB
d2 = awgn(dref, 20, 'measured'); 
x2 = [ d2(1) d2(1:end-1) ]; 
M2 = 90; 
mi2 = 0.01; 

y2 = []; e2 = []; 
bx2 = zeros(M2,1); 
h2 = zeros(M2,1); 

for m = 1 : length(x2)
    bx2 = [ x2(m); bx2(1:M2-1) ]; 
    y2(m) = h2' * bx2; 
    e2(m) = d2(m) - y2(m);
    h2 = h2 + mi2 * e2(m) * bx2; 
    % h2 = h2 + mi2 * e2(m) * bx2 /(bx2'*bx2); % NLMS
end

%% awgn 40dB
%za d³ugo siê dostosowuje i za ma³o próbek ¿eby osi¹gn¹æ wartoœæ SNR ko³o 40

d4 = awgn(dref, 40,'measured'); 
x4 = [ d4(1) d4(1:end-1) ]; 
M4 = 90; 
mi4 = 0.03; 

y4 = []; e4 = []; 
bx4 = zeros(M4,1); 
h4 = zeros(M4,1); 

for j = 1 : length(x4)
    bx4 = [ x4(j); bx4(1:M4-1) ]; 
    y4(j) = h4' * bx4; 
    e4(j) = d4(j) - y4(j); 
    h4 = h4 + mi4 * e4(j) * bx4; 
    % h4 = h4 + mi4 * e4(j) * bx4 /(bx4'*bx4); % NLMS
end

%% wykresy
figure(1);

subplot(3,1,1);
plot(t,dref,t,d,t,y);
title('AWGN 10dB');
legend('Sygnal czysty','Zaszumiony','Po odszumieniu');

subplot(3,1,2);
plot(t,dref,t,d2,t,y2);
title('AWGN 20dB');
legend('Sygnal czysty','Zaszumiony','Po odszumieniu');

subplot(3,1,3);
plot(t,dref,t,d4,t,y4);
title('AWGN 40dB');
legend('Sygnal czysty','Zaszumiony','Po odszumieniu');

%% SNR
SNR10 = 10*log10((1/fs*sum(dref.^2))/(1/fs*sum((dref-y).^2)));
display(SNR10);

SNR20 = 10*log10((1/fs*sum(dref.^2))/(1/fs*sum((dref-y2).^2)));
display(SNR20);

SNR40 = 10*log10((1/fs*sum(dref.^2))/(1/fs*sum((dref-y4).^2)));
display(SNR40);

%1/N jest bo to jest nie stosunek sygna³u do szumu tylko stosunek MOCY
%sygna³u do MOCY szumu
%zerkam do wzoru definiuj¹cego filtr - mno¿ê przez sygna³ przesuniêty o 1
%próbkê, wiêc mog¹ wystêpowaæ jakieœ anomalie i parametr SNR mo¿e nie byæ
%do koñca wiarygodny - ro¿nice miêdzy tym co mamy na wejœci, a co mamy na
%wyjœciu - straamy siê uzyskaæ jak najwiêkszy SNR
%M = 90
