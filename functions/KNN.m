function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;
  
  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);
  
  % pentru fiecare rand calculati distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument
  for i = 1 : m
    distance(i) = sqrt(sum((Y(i, :) - test).^2));
  end
  
  % ordonati crescator distantele si tineti minte intr-un vector primele
  % k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  % dovedit a fi cele mai apropiate
  [~, indices] = sort(distance);
  k_labels = labels(indices(1:k));
  
  % calculati predictia ca mediana celor k valori cele mai apropiate
  prediction = median(k_labels);
endfunction
