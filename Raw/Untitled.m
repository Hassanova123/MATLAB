Re = (density * D * Q) / ( u * A)
f^-0.5 = -2.0 * log [((roughness/D)/3.7)+ (2.51/(Re*f^0.5))]
%initialisation
error=1;
tol=10e-5;
a=-5; %the lower endpoint of the [a,b] interval
b=5; %the higher endpoint of the [a,b] interval
k=0;
%main algorithm
while error > tol % Loop ends when condition is violated.
x = (a + b)/2; % Calculates the midpoint of a and b.
f_x = x^3+2*x^2+4*x+25; % Inserts midpoint into the function.
if f_x < 0
a = x; % Reassigns a and b values
elseif f_x > 0
b = x;
end
error=abs(f_x);
k=k+1; %number of iterations
end
%output
fprintf('Iteration needed: %d, converged answer, x=%.4f, err=%.8f\n', k, x, error);
Add the following lines to the program to compare the result with that computed
using a built-in function: vpasolve
Link to help: https://uk.mathworks.com/help/symbolic/vpasolve.html
Example – Bisection (solve using a built-in vpasolve funct