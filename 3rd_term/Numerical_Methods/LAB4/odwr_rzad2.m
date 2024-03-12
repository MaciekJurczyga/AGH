function [U] = odwr_rzad2(A)
if det(A) == 0
    U = 0
else 
     U = 1/(A(1,1)*A(2,2) - A(2,1)*A(1,2)) * [A(2,2) -A(1,2); ...
                                        -A(2,1) A(1,1)];
end
end