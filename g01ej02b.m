  L1 = 0;
  L2 = 2;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 0;
  model.cp = 0;
  model.k = 1;
  model.c = 1; # No hay reaccion ni fuente interna
  model.G = 0*xnode;

  T_ini = zeros(N,1);

  cb = [1 100 -1; 2 0 -1];

  et = [0 -1 -1 -1]; # Estado estacionario

  [T_b] = difFinitas(xnode, model, cb, et, T_ini');
  T_b_analitica = @(x) (100 * e.^(-x) .* (e.^(2*x) + e.^4))/(1+e.^4)

  figure(1)
  plot(xnode,T_b)
  hold on
  plot(xnode,T_b_analitica(xnode))
