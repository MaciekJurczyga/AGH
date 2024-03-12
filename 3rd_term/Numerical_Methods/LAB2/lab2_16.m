clear all
clc
close all
%sprawdzanie poprawnośći wzoru 
syms  x1 b a c  %zmienne symboliczne pozwalające do tworzenia wyrażeń algebraicznych

x1 = -b/(2*a)-(sqrt(b^2-4*a*c))/(2*a);
dx1_db = diff(x1,b)
condx1_b = (b * dx1_db)/x1 %wynik pokazuje dziwny, ale po przekstałceniach jest poprawny, matlab nie doporowadza do najprostrzej postaci



