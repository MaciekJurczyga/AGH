
function [U] = odwrot_recursive(A, row_index, column_index, matrix_size, X)
global Z;
Z = X;
if row_index == 1   
   if column_index == 1
       Matrix_dop = create_dop_matrix(A, row_index, column_index);
       Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
   else
       odwrot_recursive(A, row_index, column_index - 1, matrix_size, Z);
       Matrix_dop = create_dop_matrix(A, row_index, column_index);
       Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
   end
else
   if column_index == 1
       Matrix_dop = create_dop_matrix(A, row_index, column_index);
       Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
   else
       odwrot_recursive(A, row_index, column_index - 1, matrix_size, Z);
       Matrix_dop = create_dop_matrix(A, row_index, column_index);
       Z(row_index,column_index) = (-1).^(row_index+column_index) * det(Matrix_dop);
   end
   if column_index == matrix_size
        odwrot_recursive(A,row_index-1, column_index, matrix_size, Z);
   end
end
if row_index == matrix_size && column_index == matrix_size
U = (1/(det(A))) * Z.';
end
end

