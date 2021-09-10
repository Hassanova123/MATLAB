error = 1;
tol = 10e-5;
a = -5; %the lower endpoint of the [a,b] interval
b = 5; %the higher endpoint of the [a,b] interval
k = 0; %main algorithm
while error > tol % Loop ends when condition is violated.
    
 p = 0.9*1000; % density (kg/m3)
 u = 8*0.001; % viscosity (Pa.s)
 D = 4*0.0254; % Inner Diameter of pipe (m)
 Ar = (pi*D^2)/4; % Area of the pipe (m2)
 Q = (2000*42*(3.785*10^-3))/(24*60*60); % Volumetric flowrate (m3/s)
 e = 0; % Dimensionless surface roughness of pipe
 
 Re = (p*Q*D)/(u*Ar); % Reynold's Number

x = (a + b)/2 ; % Calculates the midpoint of a and b.

f_x = -2*log10(((e/D)/3.7)+(2.51/(Re*x^0.5)))-(1/x^0.5); % Colebrook equation

if f_x < 0
b = x; % Reassigns a 
elseif f_x > 0
a = x; % Reassigns b values
end
error =abs(f_x);
k=k+1; %number of iterations
end %output
fprintf('Iteration needed: %d, converged answer, x=%.4f, err=%.8f\n', k, x, error);