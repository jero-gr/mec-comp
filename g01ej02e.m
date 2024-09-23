  L1 = 5;
  L2 = 10;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 1;
  model.cp = 1;
  model.k = 2;
  model.c = 0; # No hay reaccion ni fuente interna
  model.G = xnode.^3;

  T_ini = zeros(N,1);

  cb = [3 2 100; 1 50 -1];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T] = difFinitas(xnode, model, cb, et, T_ini');
  T_analitica = @(x) -x.^5 * (1/40) + 1225 * x * (1/3) - 4600/3;

  figure(1)
  plot(xnode,T)
  hold on
  plot(xnode,T_analitica(xnode))
