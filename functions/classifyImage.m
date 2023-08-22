function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie
  prediction = -1;
  
  % cast im la double
  im = double(im);
  
  % aplica functia magic_with_pca setului de date de antrenament
  [tm_pca, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % scade din vectorul imagine media fiecarei coloane din train_mat
  im -= miu;
  
  % schimbati baza inmultind cu matricea Vk
  im_test = im * Vk;
  
  % calculati predictia folosindu-va de metoda k nearest neighbour
  % implementata anterior cu k = 5.
   prediction = KNN(train_val, tm_pca, im, 5);
endfunction
