
# a)
  L1 = 0;
  L2 = 1;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 0;
  model.cp = 0;
  model.k = 2;
  model.c = 0; # No hay reaccion ni fuente interna
  model.G = 0*xnode + 100;

  T_ini = zeros(N,1);

  cb = [1 10 -1; 1 50 -1]; #[dirichlet, u(0)=10, dirichlet; dirichlet, u(1)=50, dirichlet]

  et = [0 -1 -1 -1]; # Estado estacionario

  [T_a] = difFinitas(xnode, model, cb, et, T_ini');
  T_a_analitica = @(x) -25*x.^2 + 65*x + 10

  figure(1)
  plot(xnode,T_a)
  figure(2)
  plot(xnode,T_a_analitica(xnode))
