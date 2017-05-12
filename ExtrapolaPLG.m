function [xReq] = ExtrapolaPLG(tx,tReq)
    g = max(size(tx))-1;
    t = tx(:,1);
    x = tx(:,2);
    f = zeros(g+1,1);
    j = 1;
    for j = 1:(g+1)
    fi = 1;
        for i = 1:(g+1)
            if i!=j
            fi = fi*(tReq-t(i,1))/(t(j,1)-t(i,1));    
        end
        f(j,1) = fi;
    end
    xReq = x'*f;
end