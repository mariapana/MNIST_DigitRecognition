function new_X = task2 (photo, pcs)
  [m n] = size(photo);
  
  % initializare matrice finala
  new_X = zeros(m, n);
  
  % cast photo to double
  matrix = double(photo);
  
  % normalizeaza matricea initiala scazand din ea media fiecarui rand
  miu = zeros(m, 1);
  for i = 1 : m
    miu(i) = mean(matrix(i, :));
    matrix(i, :) -= miu(i);
  endfor
  
  % construieste matricea Z
  Z = matrix' / sqrt(n - 1);
  
  % calculeaza matricile U, S si V din SVD aplicat matricii Z
  [U, S, V] = svd(Z);
  
  % construieste matricea W din primele pcs coloane ale lui V
  W = V(:, 1 : pcs);
  
  % cacluleaza matricea Y
  Y = W' * matrix;
  
  % aproximeaza matricea initiala
  new_X = W * Y + miu;
  
  % transforma matricea in uint8 pentru a fi o imagine valida
  new_X = uint8(new_X);
endfunction
