% evd_elipsa.m
clear all; close all;
N = 1000;
% Elipsa - symetryczna macierz kowariancji elipsy
% żeby przetestować zmienić wartość S<numer> na S
S1 = [1 -0.5; -0.5 2]; 
S2 =[1 0.5; 0.5 2]; %Porównanie nachylenia
S3 = [12, 4; 4,12]


phi = pi/2; % Kąt obrotu w radianach
R = [cos(phi) -sin(phi); sin(phi) cos(phi)]; % Macierz obrotu
S4 = R * [1 0.5; 0.5 1] * R'; 
S5 = [2 2;2 2]; %linia prosta
S = [1 0; 0 1]; %zbliżone do koła (chyba nawet idealne koło)

x = elipsa(S,1,N);
figure; plot(x(1,:),x(2,:), 'ro'); grid; hold on;
x = x .* (2*(rand(1,N)-0.5)); %losowe przesunięcie punktów wzg osi x
%x = x .* (0.33*(randn(1,N)));
plot(x(1,:),x(2,:), 'b*'); grid;
xlabel('x'); ylabel('y'); title('Circle/Ellipse'); grid; axis square
function x = elipsa(S,r,N)
[V,D] = eig(S); % EVD
V = V*sqrt(r*D); % macierz transformacji y (okrag) --> x (elipsa)
alfa = linspace(0,2*pi,N); % katy okregu
x = V * [ cos(alfa); sin(alfa)]; % transformacja punktow okregu na elipse
end
%tak, jest związek, bo kolumny macierzy V określają kierunki osi elipsy po
%rotacji, a wartości własne określają rozciągnięcie

