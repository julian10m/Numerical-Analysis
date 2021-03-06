function [err_trap, err_gau2, err_simp]=integration(N);
% ---------------------------
% Etant donne un entier N, on integre numeriquement la fonction f
% definie ci-apres sur l'intervalle [a,b] dont les bornes sont 
% definies ci-dessous.
% 
% parametres
% ----------
%  N        : nombre d'intervalles pour la discretisation de [a,b]
% sorties

% Bornes de l'intervalle
a = 0.;
b = 1.;

% Fonction f a integrer
% voir fin du fichier 

% Valeur exacte de l'integrale de f sur [a,b] = [0,1]
#  exact = -1./(10*pi);
   exact = 1/5;
% Pas d'espace
h = (b-a)/N;

% ------------------------------------------------------------
% Formules de quadrature
% -----------------------------------------------------------

% Formule du trapeze 
% ------------------

Lhtrap = 0.;
for i=0:N-1,
	xi=a+i*h;
	Lhtrap = Lhtrap + f(xi) + f(xi+h);
end
Lhtrap = h/2 * Lhtrap;
% Formule de Gauss a deux points 
% ------------------------------

Lhgau2 = 0.;

for i=0:N-1,
	xi=a+i*h;
	Lhgau2 = Lhgau2 + f(xi+ h*(1-1/sqrt(3))/2) + f(xi+ h*(1+1/sqrt(3))/2);
end
Lhgau2 = h/2 * Lhgau2;
% Formule de Simpson
% ------------------

Lhsimp= 0.;

for i=0:N-1,
	xi=a+i*h;
	Lhsimp =  Lhsimp + f(xi) + 4*f(xi+h/2) + f(xi+h);
end
Lhsimp = h/6 * Lhsimp;
% ------------------------------------------------------------

err_trap = abs(exact-Lhtrap);
err_gau2 = abs(exact-Lhgau2);
err_simp = abs(exact-Lhsimp);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fonction f a integrer
function f=f(x)
  f= x.^4;
# f= x*sin(10*pi*x);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

