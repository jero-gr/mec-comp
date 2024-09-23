  L1 = 0;
  L2 = 1;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 0;
  model.cp = 0;
  model.k = 1;
  model.c = 1; # No hay reaccion ni fuente interna
  model.G = 0*xnode + 50;

  T_ini = zeros(N,1);

  cb = [1 10 -1; 3 0.2 50];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T] = difFinitas(xnode, model, cb, et, T_ini');
  T_analitica = @(x) -36.6897 * e.^(-x) - 3.3103 * e.^(x) + 50;

  figure(1)
  plot(xnode,T)
  hold on
  plot(xnode,T_analitica(xnode))
