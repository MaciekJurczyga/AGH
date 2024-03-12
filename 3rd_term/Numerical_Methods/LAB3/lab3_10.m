clear all
close all
clc
babiaGora = load('babia_gora.dat');
myPlot(babiaGora), title('bez obrotu');
myPlot(babiaGora*rotationMatrixDeg(90,90,180)), title('obrót');

function myPlot(P)
    figure, grid, plot3(P(:,1), P(:,2), P(:,3), '.')
end

function [A] = rotationMatrix(z, y, x)
    Rx = [ 1, 0, 0; 0, cos(x), -sin(x); 0, sin(x), cos(x) ]; % macierz rotacji wzg. x
    Ry = [ cos(y), 0, -sin(y); 0, 1, 0; sin(y), 0, cos(y) ]; % macierz rotacji wzg. y
    Rz = [ cos(z), -sin(z), 0; sin(z), cos(z), 0; 0, 0, 1 ]; % macierz rotacji wzg. z
    A = Rz * Ry * Rx;  
end
function [A] = rotationMatrixDeg(z,y,x)
    A = rotationMatrix(z/360*2*pi, y/360*2*pi,x/360*2*pi);
end






