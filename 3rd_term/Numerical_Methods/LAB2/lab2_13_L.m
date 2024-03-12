clear all
clc
a = 0.01;
b = 10^7;
c = 0.03;
delta = b^2-(4*a*c);
if delta == 0
    x1 = -b/(2*a);
    x2 = x1;
else
    x1 = (-b+sqrt(delta))/(2*a)  %b^2>>4ac, dochodzi do kastarofalnego odejmowania
    x2 = (-b-sqrt(delta))/(2*a)
    if abs(x1)>abs(x2)
        x2 = (2*c)/(-b+sqrt(delta));
    elseif abs(x2) > abs(x1)
        x1 = (2*c)/(-b-sqrt(delta)); %ten sposób działa
    end
end 
x1
x2