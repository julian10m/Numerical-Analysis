function [fapprox,funct,tt]=Week_3_Extra(n, N) 
  a3 = 6(1);
  a2 = 5*rand(1);
  a1 = 5*rand(1);
  a0 = 5*rand(1);

  # Limites de Integracion
  a=0; # Inferior
  b=1; # Superior

  # N=10; # Cantidad de tramos en que se divide la integral
  h =(b-a)/N; # Paso de cada tramo

  Nd = 50; # Cantidad de puntos por tramo, para graficar con precision
  #n = 2 # Grado del polinomio que interpola en cada intervalo

  fapprox = zeros(Nd+1,N);
  funct = zeros(Nd+1,N);
  tt = zeros(Nd+1,N);
  for i=0:N-1
    ai = a+h*i;
    bi = ai+h;
    t = ai:h/Nd:bi;
    ti = ai:h/n:bi;
    for k=1:n+1
      fapprox(:,i+1) = fapprox(:,i+1) + (f(ti(k),a3,a2,a1,a0) * phi(n,k,ti,t))';
    end
    funct(:,i+1) = (f(t,a3,a2,a1,a0))';
    tt(:,i+1) = t';
  end
fapprox = [fapprox(1:end-1,:)(:); fapprox(end:end)]; 
funct = [funct(1:end-1,:)(:); funct(end:end)];  
tt = [tt(1:end-1,:)(:); tt(end:end)];
plot(tt, fapprox(:),'r*', 'linewidth',1);
hold on;
plot(tt, funct(:),'b'); 
legend('fapprox','pol');
end
 
function phi = phi(n,k,ti,t)
  phi = 1;
  for j=1:n+1
    if j~=k
      phi = phi.*(t-ti(j))./(ti(k)-ti(j));
    end
  end
end

function f = f(xx, a3, a2, a1, a0)
# f = xx.*sin(10*pi*xx);
 f = 1./(1+25*xx.*xx);  
# f = a3*xx.^3+a2*xx.^2 + a1*xx + a0;
end
