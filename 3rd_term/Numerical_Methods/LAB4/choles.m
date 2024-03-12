    function [L,U] = choles(A)
[N, N] = size(A);
L = eye(N);
   for j=1:N
       value=0;
       for k=1:j-1
           value = value + L(j,k)*L(j,k);
       end
       L(j,j) = sqrt(A(j,j) - value);
       for i=j+1:N
           value = 0;
           for k=1:j-1
               value = value + L(i,k)*L(j,k);
           end
           L(i,j) = (1/L(j,j)) * (A(i,j) - value);
       end
   end
   U = L.';