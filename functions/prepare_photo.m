function sir = prepare_photo (im)
  sir = zeros(1, 784);

  % inverseaza pixeli
  im = 255 - im;

  im = im';
  sir = reshape(im, 1, 784);
end