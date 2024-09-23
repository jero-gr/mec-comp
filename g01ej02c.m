  L1 = 1;
  L2 = 5;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 0;
  model.cp = 0;
  model.k = 1;
  model.c = 0; # No hay reaccion ni fuente interna
  model.G = 100 * (xnode-3).^2;

  T_ini = zeros(N,1);

  cb = [2 2 -1; 1 0 -1];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T] = difFinitas(xnode, model, cb, et, T_ini');

  a = -1350;
  b = 1906;
  c = 2345;

  T_analitica = @(x) (-25*x.^4 + 300*x.^3 + a*x.^2 + b*x + c)/3

  figure(1)
  plot(xnode,T)
  hold on
  plot(xnode,T_analitica(xnode))
