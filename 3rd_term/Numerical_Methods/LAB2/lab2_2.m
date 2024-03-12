clear all
clc
a=fi( 1.625,0,8,7), a.bin;
b=fi( 0.375,0,8,7), b.bin;
c=fi( 0.375,1,8,7), c.bin;
d=fi(-0.375,1,8,7), d.bin;
e=fi(pi,0,8,6), e.bin
f=fi(pi,0,16,13), f.bin;
g=fi(-pi,1,8,5), g.bin;
h=fi(-pi,1,16,10), h.bin;
pi_restored = 0;
for i = (1:length(e.bin))
     pi_restored = pi_restored + str2num(e.bin(i))*2^(2-i);
     
end
pi_restored
pi_difference = pi_restored/pi
