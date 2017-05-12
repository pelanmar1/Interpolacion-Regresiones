function [xReq] = ExtrapolaDDN(tx,tReq)
  g = max(size(tx))-1;
  t = tx(:,1);
  x = tx(:,2);
  
  f = zeros(g+1,g+2);
  p = zeros(g+1,1);
  p= [1;cumprod(repmat(tReq, (g+1),1)-t)(1:g)];
  
  f(:,1) = t;
  f(:,2) = x;
  
  for k = (g+1):-1:2
      for i =2:k  
        fi = (f(i,(g+3)-k)-f(i-1,(g+3)-k))/(f(i+((g+1)-k),1)-f(i-1,1));
        f(i-1,(g+4)-k) = fi;
      end
  end
  xReq = f(1,2:(g+2))*p;
end


