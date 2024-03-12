clear all
close all
clc

N = 200;
M=4;
t = linspace(0, (N/M)*2*pi, N); 
x = sin(t);
T=2*pi;
t_interp = linspace(0, (N/M)*2*pi, N*8); 
x_interp = zeros(size(t_interp)); 

for i = 1:length(t_interp)
    for n = 1:length(t)
        x_interp(i) = x_interp(i) + x(n) * sinc(pi/T * (t_interp(i) - t(n)));
    end
end

plot(t, x, 'o', t_interp, x_interp, 'g-'); 
legend('Sinusoida oryginalna', 'Sinusoida zinterpolowana');
xlabel('Czas');
ylabel('Amplituda');
title('Interpolacja sinusoidy przy użyciu funkcji sinc()');