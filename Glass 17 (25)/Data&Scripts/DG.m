function [ ret ] = DG(a, d, N, lambda, I0, theta0, theta )
    theta=theta*2*pi/360;
    theta0=theta0*2*pi/360;
    k=2*pi/lambda;
    p=sin(theta-theta0);
    
    r1=(sin(N*k*d*p/2)./sin(k*d*p/2)).^2;
    r2=(sin(k*a*p/2)./(k*a*p/2)).^2;
    ret=I0*r1.*r2;
    
end

