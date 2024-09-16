# u'      - u''       = 100*(1-x) -> no estacionario con condiciones de contorno mixtas
# c*p*u'  - K_0 * u'' = Q(x,t)
# c*p = 1; K_0 = 1; Q = @(x) 100*(1-x);
# k = K_0/cp = 1;
# q = Q/cp = Q
# x_a = 0
# x_b = 1
# u(0,t) = 0
# du(1,t) = 0 -> H_1 = 0; u_E(t) = 0
# u(x,0) = u_0(x) = 10x - 5x^2

# a)
  L1 = 0;
  L2 = 1;
  N = 100;
  dx = (L2-L1)/N;
  xnode = L1:dx:L2;

  model.rho = 1; # No definido, se asume 1
  model.cp = 1; # No definido, se asume 1
  model.k = 1;
  model.c = 0; # No hay reaccion ni fuente interna
  model.G = 100*(1-xnode);

  cb = [1 0 -1; 2 0 -1]; #[dirichlet, u(0)=0, dirichlet; neumann, du(1)=0, neumann]

  et = [0 0 0 0]; # Estado estacionario

  T_ini = 10*xnode - 5*xnode.^2;

  [T] = difFinitas(xnode, model, cb, et, T_ini);

  plot(xnode,T)

  hold on;
  plot(xnode,T_ini)

# c)
  T(xnode==1/2)

# b)
  dt = 0.01;
  et = [2 1000 0.0001 dt]; # Implícito
  [T] = difFinitas(xnode, model, cb, et, T_ini);
