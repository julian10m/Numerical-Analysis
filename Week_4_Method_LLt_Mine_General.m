function L = Descomp_LLt(A)
  L = zeros(size(A));
  N = size(A,1);
  
  L(1,1) = sqrt(A(1,1));  
  L(:,1) = A(:,1)/L(1,1);
  for jj=2:N
    aux_ljj = A(jj,jj);
    ii = jj-1;
    while(ii)
      aux_ljj -= L(jj,ii)^2;
      ii -= 1;  
    endwhile
    aux_ljj = sqrt(aux_ljj);
    
    L(:,jj) = A(:,jj);
    ii = jj-1;
    while(ii)
      L(:,jj) -= L(jj,ii)*L(:,ii);
      ii -= 1;  
    endwhile
    L(:,jj) /= aux_ljj;
  end
endfunction
