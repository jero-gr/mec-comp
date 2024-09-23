  L1 = 0;
  L2 = 1;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 1;
  model.cp = 2;
  model.k = 2;
  model.c = 2; # No hay reaccion ni fuente interna
  model.G = xnode * 0 + 75;

  T_ini = zeros(N,1);

  cb = [1 0 -1; 3 2 10];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T] = difFinitas(xnode, model, cb, et, T_ini');
  a = 11 - 30*e
  T_analitica = @(x) -(5/4) .* e.^(-x-1) .* (e.^x - 1) .* (11*e.^x + a);

  figure(1)
  plot(xnode,T)
  hold on
  plot(xnode,T_analitica(xnode))
