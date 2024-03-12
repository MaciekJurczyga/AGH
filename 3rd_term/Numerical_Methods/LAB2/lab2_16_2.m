clear all
clc
close all
format long
a = 0.5;
b = 1 + 0.001*randn(1,1000);
c = 0.45;
sumx = [];
sumcondx1_b = [];

for i = 1:size(b, 2)
    x1 = (-b(i)-sqrt(b(i)^2-(4*a*c)))/(2*a);
    condx1_b = b(i)/(sqrt(b(i)^2-(4*a*c)));
    sumx(i) = x1;
    sumcondx1_b(i) = condx1_b;

end
disp("średnia x= " + mean(sumx))
disp("odchylenie x= " + std(sumx))
disp("średnia uwarunkowania= " + mean(sumcondx1_b))  
disp("odchylenie uwarunkowania= " + std(sumcondx1_b)) 
