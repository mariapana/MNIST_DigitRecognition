function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;
  
  % initializare train_mat
  train_mat = zeros (no_train_images, n);
  
  %initializare train_val
  train_val = zeros (1, no_train_images);
  
  % incarca datele din tabelul primit ca argument
  data = load('mnist.mat');
  
  % salveaza in matricea train_mat primele no_train_images linii din
  X = data.trainX;
  train_mat = X(1 : no_train_images, :);
  
  % salveaza in vectorul train_val primele no_train_images valori ale
  % vectorului de etichete
  Y = data.trainY;
  train_val = Y(1, 1 : no_train_images);
endfunction
