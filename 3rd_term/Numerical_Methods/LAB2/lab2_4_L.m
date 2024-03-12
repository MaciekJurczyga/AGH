clear all
clc
c = 299792458;
c_bit32 = num2bitstr(single(c));
c_bit64 = num2bitstr(double(c));
sing = c_bit32(1);
exponent = c_bit32(2 : 2+(8-1));
mantisa = c_bit32(2+8 : 2+8+(23-1));
exponent64 = c_bit64(2 : 2+(11-1));
mantisa64 = c_bit64(2+11 : 2+11+(52-1));
exponentDecimal32 = 0;
exponentDecimal64 = 0;
mantisaDecimal32 = 2^0;
mantisaDecimal64 = 2^0;
c_decimal32 = 0;
c_decimal64 = 0;
sign = 0;
bias32 = 127;
bias64 = 1023;
%single
for i = 1:length(exponent)
    exponentDecimal32 = exponentDecimal32 + str2num(exponent(i)) * 2^(length(exponent)-i);
end 
exponentDecimal32 = exponentDecimal32 - bias32;
for i = (1:length(mantisa))
    mantisaDecimal32 = mantisaDecimal32 + str2num(mantisa(i)) * 2^(-i);
end
c_decimal32 = (-1)^sign * mantisaDecimal32 * 2^exponentDecimal32
%double
for i = 1:length(exponent64)
    exponentDecimal64 = exponentDecimal64 + str2num(exponent64(i)) * 2^(length(exponent64)-i);
end 
exponentDecimal64 = exponentDecimal64 - bias64;
for i = 1:length(mantisa64)
    mantisaDecimal64 = mantisaDecimal64 + str2num(mantisa64(i)) * 2^(-i);
end
c_decimal64 = (-1)^sign * mantisaDecimal64 * 2^exponentDecimal64






