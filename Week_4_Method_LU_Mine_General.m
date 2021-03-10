function [L, U] = Descomp(A)

  N = size(A,1);

  L = zeros(size(A));
  U = zeros(size(A));

  L(:,1) = A(:,1);
  U(1,:) = A(1,:)/A(1,1);

  for jj=2:N
    L(:,jj) = A(:,jj);
    U(jj,:) = A(jj,:);
    ii = jj-1;
    while(ii)
      L(:,jj) -= L(:,ii)*U(ii,jj);
     ii -= 1;  
    endwhile
    ii = jj-1;
    while(ii)
      U(jj,:) -= U(ii,:)*L(jj,ii);
      ii -=1;
    endwhile
    U(jj,:) /= L(jj,jj);
  end 
 endfunction