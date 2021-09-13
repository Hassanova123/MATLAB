clc; % Clear the command window
close all; % Close all previously opened figure windows
clear all; % Clear all previously generated variables
 
N = 41; % Number of nodes
nStep = 500; % Number of time levels
L = 2.0; % Domain length
dx = L/(N-1); % Node spacing
dt = 0.0005; % Time step
D = 1; % Diffusion coefficient
A = 1; % Amplitude of the initial sine wave
k = 1; % Frequency of the initial sine wave
U = 0; % Advection speed
f = zeros(N,1); % Calculated solution at the new time level (level n+1)
fOld = zeros(N,1); % Calculated solution at the previous time level (level n)
exact = zeros(N,1); % Exact solution
time = 0;

% Use the given initial condition
for j = 1:N % Node counter
 x = dx*(j-1); % x coordinate of node i
 fOld(j) = 0.75*exp(-((x-0.5)/0.1).^2);
end
fprintf('Watch the progress of the solution in the figure window.\n\n')
fprintf('Press Ctrl-C in the command line window to terminate the code.\n\n')

for n = 1:nStep % Time loop. n is the time level counter
 G=n*dt
 if G<=1
 time = time+dt
 end
 
 % Calculate the solution of this time level, i.e. f_n+1, for inner points
 for j = 2:N-1
 f(j) = fOld(j) - U*dt/(2*dx) * (fOld(j+1) - fOld(j-1)) + ...
 D*dt/dx^2 * (fOld(j+1) - 2*fOld(j) + fOld(j-1));
 end
 
 % Calculate the solution of the last point (Right boundary)
 f(N) = fOld(N) - U*dt/(2*dx) * (fOld(2) - fOld(N-1)) + ...
 D*dt/dx^2 * (fOld(2) - 2*fOld(N) + fOld(N-1));
 
 f(1) = f(N); % Due to the periodic BC
 
 hold off;
 plot(f, 'linewidth',2); % Plot the calculated solution
 grid on;
 axis([1 N 0, 1.0]);
 xlabel('Node number');
 ylabel('f');
 title('1D Diffusion Solution with Periodic BCs')
 
 hold on;
 plot(exact,'r--','linewidth',2); % Plot exact solution of the previous time step
 legend('Numerical','Exact');
 pause(0.01);
 
 % Calculate L2 error
 Error = dx * sqrt(sum((f - exact).^2))
 
 % Get ready for the new time level before the loop ends
 fOld = f;

end % End of the time loop
fprintf('Done. The code is terminated successfuly.\n\n')
