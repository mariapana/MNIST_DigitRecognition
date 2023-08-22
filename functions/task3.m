function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala
  new_X = zeros (m, n);
  
  % cast photo la double
  matrix = double(photo);
  
  % calculeaza media fiecarui rand al matricii
  % normalizeaza matricea initiala scazand din ea media fiecarui rand
  miu = zeros(m, 1);
  for i = 1 : m
    miu(i) = mean(matrix(i, :));
    matrix(i, :) -= miu(i);
  endfor
  
  Z = 1/(n - 1) * matrix * matrix';
  
  % calculeaza vectorii si valorile proprii ale matricei de covarianta
  [V, S] = eig(Z);
  
  % ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  % pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V(:, 1 : pcs);
  
  % creaza matricea Y schimband baza matricii initiale
  Y = W' * matrix;
  
  % calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y + miu;

  % aduna media randurilor scazuta anterior
  for i = 1 : m
    new_X(i, :) += miu(i);
  endfor

  % transforma matricea in uint8 pentru a fi o imagine valida
  new_X = uint8(new_X);
endfunction
