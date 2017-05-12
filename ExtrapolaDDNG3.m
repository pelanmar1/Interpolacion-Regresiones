function [xReq] = ExtrapolaDDNG3()
  x = load('tx.txt');  
  t = x(2:5,1);
  x = x(2:5,2);
  tReq = 10.39291399;
  
  f = zeros(4,5);
  p = zeros(4,1);
  p= [1;cumprod(repmat(tReq, 4,1)-t)(1:3)];
  
  
  f(:,1) = t;
  f(:,2) = x;
  
  for k = 4:-1:2
      for i =2:k  
        fi = (f(i,6-k)-f(i-1,6-k))/(f(i+(4-k),1)-f(i-1,1));
        f(i-1,7-k) = fi;
      end
  end
  xReq = f(1,2:5)*p;
end