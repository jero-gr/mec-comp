  L1 = 0;
  L2 = 1;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 1;
  model.cp = 1;
  model.k = 2;
  model.c = -2; # No hay reaccion ni fuente interna
  model.G = xnode * 0;

  T_ini = zeros(N,1);

  cb = [1 50 -1; 2 5 -1];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T] = difFinitas(xnode, model, cb, et, T_ini');

  T_analitica = @(x) 73.2433 * sin(x) + 50 * cos(x);

  figure(1)
  plot(xnode,T)
  hold on
  plot(xnode,T_analitica(xnode))
