function new_X = task1 (photo, k)
  [m, n] = size (photo);
  
  % initializare matrice finala
  new_X = zeros (m, n);
  
  % cast photo la double
  matrix = double(photo);
  
  % aplica algoritmul SVD asupra photo
  [U S V] = svd(matrix);
  
  % calculeaza noile matrici reduse U, S si V.
  % calculeaza new_X care este aproximarea matricii initiale photo,
  % folosindu-va de matricile calculate anterior.  
  V = V';
  new_X = U(1:m, 1:k) * S(1:k, 1:k) * V(1:k, 1:n);
 
  new_X = uint8(new_X);
endfunction
