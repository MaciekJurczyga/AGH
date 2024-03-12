clear all
close all
clc
clear all;
close all;
clc;

fs = @(x) sin(x);
fc = @(x) cos(x);

asin = 0;
bsin = pi;

acos = -pi/2;
bcos = pi/2;

resSinMatlab = integral(fs, asin, bsin);
resCosMatlab = integral(fc, acos, bcos);

nodes3 = [-(3/5)^(1/2), 0, (3/5)^(1/2)];
weights3 = [5/9, 8/9, 5/9];

nodes2 = [-1/3^(1/2), 1/3^(1/2)];
weights2 = [1, 1];

N = 3;
resSin3 = 0;
resCos3 = 0;
for i = 1:N
    resSin3 = resSin3 + weights3(i) * fs((asin+bsin)/2 + (bsin-asin)/2 * nodes3(i));
    resCos3 = resCos3 + weights3(i) * fc((acos+bcos)/2 + (bcos-acos)/2 * nodes3(i));
end
resSin3 = resSin3 * (bsin - asin)/2;
resCos3 = resCos3 * (bcos - acos)/2;

errSin3 = abs(resSinMatlab - resSin3);
errCos3 = abs(resCosMatlab - resCos3);

disp('Wyniki dla wbudowanej funkcji integral:');
display(resSinMatlab);
display(resCosMatlab);

disp('Wyniki dla kwadratury Gaussa-Lagrange''a (N=3):');
display(resSin3);
display(resCos3);

disp('Błąd dla kwadratury Gaussa-Lagrange''a (N=3):');
display(errSin3);
display(errCos3);

N = 2;
resSin2 = 0;
resCos2 = 0;
for i = 1:N
    resSin2 = resSin2 + weights2(i) * fs((asin+bsin)/2 + (bsin-asin)/2 * nodes2(i));
    resCos2 = resCos2 + weights2(i) * fc((acos+bcos)/2 + (bcos-acos)/2 * nodes2(i));
end
resSin2 = resSin2 * (bsin - asin)/2;
resCos2 = resCos2 * (bcos - acos)/2;

errSin2 = abs(resSinMatlab - resSin2);
errCos2 = abs(resCosMatlab - resCos2);

disp('Wyniki dla kwadratury Gaussa-Lagrange''a (N=2):');
display(resSin2);
display(resCos2);

disp('Błąd dla kwadratury Gaussa-Lagrange''a (N=2):');
display(errSin2);
display(errCos2);