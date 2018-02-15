function [ret]= IFP(d, A, R, lambda)
    Rinv=1/(1-R);
    delta=4*pi*d/lambda;
    ret=((1-A*Rinv)^2)./(1+4*R*(Rinv^2)*(sin(delta/2).^2));
    
end

