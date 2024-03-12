function [L,U] = myLU(A)

[N,N] = size(A);
%A,
if(0) % teoretyczna idea --------------------------------------------
   MM=eye(N);
   for k=1:N-1
       Lk=eye(N);
       Mk(k+1:N,k) = -A(k+1:N,k)/A(k,k), pause
       MM=Mk*MM;
   end
   U = MM*A;
   L = inv(MM); % pause
   
else  % alg. Doolittle'a
    
   if(1) % prościej, wolniej -----------------------------------------
      L = eye(N); U = zeros(N,N);
      for i = 1:N
          for j=i:N
              U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
          end
          for j=i+1:N
              L(j,i) = 1/U(i,i) * ( A(j,i) - L(j,1:i-1)*U(1:i-1,i) );
          end    
      end
   elseif (0) % trudniej, szybciej ----------------------------------------
      U=A; L=eye(N);
      for i=1:N-1
          for j=i+1:N
              L(j,i)  = U(j,i) / U(i,i);
              U(j,i:N) = U(j,i:N) - L(j,i)*U(i,i:N);
          end
      end
   end    
end