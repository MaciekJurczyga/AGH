close all
clc


%A

A = 230;
f = 50;
w = 2*pi*f;
tA = [10000,500,200]; % częstotliwość próbkowania
colorsA = ["b-","r-o","k-x"];

for i = 1:3
    figure(1)
    TA = linspace(0,0.1,tA(i));
    y = A*sin(w*TA);
    plot(TA,y,colorsA(i));
    hold on;
end

%B

tB = [10000, 51, 50, 49];
colorsB = ["b-","g-o","r-o","k-o"];
for i = 1:4
    figure(2)
    TB = linspace(0,1,tB(i));
    y = A*sin(w*TB);
    plot(TB,y,colorsB(i));
    hold on;
    axis([0 1.1 -235 235]);
end

%C

A = 230;
f = 100;
TC = linspace(0,1,f);
fC = 0;

while fC<=300
    figure(3);
    wC = 2*pi*fC;
    y = A*sin(wC*TC);
    plot(TC,y)
    fC = fC+5;
    pause;
end


pickf = [5,105,205];
pickf_1 = [95,195,295];
pickf_2 = [0,95,105];
colorsC = ["b-","r-o","k-x"];
for i=1:3
    figure(3);
    wC = 2*pi*pickf(i);
    y = A*sin(wC*TC);
    plot(TC,y,colorsC(i));
    hold on;

    figure(4);
    wC = 2*pi*pickf_1(i);
    y = A*sin(wC*TC);
    plot(TC,y,colorsC(i));
    hold on;

    figure(5);
    wC = 2*pi*pickf_2(i);
    y = A*sin(wC*TC);
    plot(TC,y,colorsC(i));
    hold on;
end

