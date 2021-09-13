clear all;
clc;

for e = 0: 0.002: 0.008 % Dimensionless surface roughness of pipe
Re = linspace(5000, 100000, 50); % Reynold's Number
D = linspace(4*0.0254, 4*0.0254, 50) ; % Inner Diameter of pipe (m)
 
error =linspace(1, 1, 50);
tol = linspace(10e-5, 10e-5, 50);
a = linspace(0 , 0, 50); %the lower endpoint of the [a,b] interval
b = linspace(1 , 1, 50); %the higher endpoint of the [a,b] interval
k = 0; %main algorithm

while error > tol % Loop ends when condition is violated. 
x = (a + b)/2;   % Calculates the midpoint of a and b.
f_x = -1./sqrt(x)-2.*log10(((e)/3.7)+2.51./Re.*sqrt(x)); % Colebrook equation

for i = 1:50
if f_x(i) < 0
a(i) = x(i); % Reassigns a 
elseif f_x(i) > 0
b(i) = x(i); % Reassigns b values
end
error = abs(f_x(i));
k=k+1; %number of iterations
end
disp(x)

hold on 
plot(Re, x)
grid on
title ('plot of friction factor Vs Re')
xlabel('Re')
ylabel('Friction factor')
end %output
legend ('0', '0.002', '0.004', '0.006', '0.008');
fprintf('Iteration needed: %d, converged answer, x=%.4f, err=%.8f\n', k, x, error);
hold off
end
