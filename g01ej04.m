  L1 = 0;
  L2 = 1;
  N = 40;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 1;
  model.cp = 1;
  model.k = 1;
  model.c = 0; # No hay reaccion ni fuente interna
  model.G = 0*xnode + 100;

  T_ini = - 10 * xnode.^2 + 20 * xnode;

  cb = [1 0 -1; 2 0 -1];

  et = [2 100 0.0001 0.02];

  [T] = difFinitas(xnode, model, cb, et, T_ini);

  T_ini = T(:,end)

  et = [2 100 0.0001 0.02]; # Estado estacionario
  model.G = 0*xnode;
  [T] = difFinitas(xnode, model, cb, et, T_ini');

  plot(xnode,T)

