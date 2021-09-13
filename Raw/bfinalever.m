clear all;
clc;

for i=0:0.002:0.008
    Re=linspace(5000,100000,1000);
    error=linspace(1,1,1000);
    tol=linspace(10e-10,10e-10,1000);
    a=linspace(0,0,1000);
    b=linspace(1,1,1000);
    k=0;
    
    while error > tol
        x = (a+b)/2;
        f_x = -1./sqrt(x)-(2.*log10((((i)/3.7)+(2.51./(Re.*sqrt(x)))))); % Colebrook equation
        for j=1:1000
            if f_x(j) < 0
                a(j) = x(j);
            elseif f_x(j) > 0
                b(j) = x(j);
            end
            error=abs(f_x(j));
        end
        k=k+1;
    end
    disp(x)
    
    hold on
    plot(Re,x)
    grid on
    title ('friction')
    xlabel('Re')
    ylabel('friction factor')
   legend ('0', '0.002', '0.004', '0.006', '0.008');
   fprintf('Iteration needed: %d, converged answer, x=%.4f, err=%.8f\n', k, x, error);
hold off
end