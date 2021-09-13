clear all; %Clear all previously generated variables 
clc; % Close the command window 
close all; % Close all previously opened figure windows 

xlength = 2; % Grid length 
n = 100; % Number of grid points 
h = xlength/(n-1); % gap between the grid points 
dt = 0.0001;
time = 0;
D = 1;
U = 1;
% Creating matrix of zeros to intiate the code 
x=zeros(1,n);
f=zeros(1,n);
fn=zeros(1,n);
x(1)=0D0;
Time=[0;0.25;0.5;1;2;3];%Time matric values 
hold on
for J = 1:6
   nt = Time(J)/dt;
   for i = 2:n
     x(i) = x(i-1)+h;
   end
   % Initiating function 
   f(1) = 1; % Initial condition ofr the upwind method 
for i = 2:n % Initiating iteration loop 
f(i) = 0; % Intial condition for the upwind method 
end
for k = 1:nt % from one up to "nt", indicating maximum number of iteration
for i = 2:n-1 % creates array of range for n and initiates iteration loop.
% Determing the function of each of mass transport contribution such as:
% Advection and Molecular Diffusion (Ficks Law)
flux1 = D * (f(i+1)-(2*f(i))+f(i-1)); % Diffusion Term
flux2 = -U * (f(i)-f(i-1));           % Advection Term 
fn(i) = f(i)+(dt/(h^2))*flux1+(dt/h)*flux2; % Assigning difference equation
% Difference equation includes the advection and diffusion contribution
% Studying the net effect of both contribution under boundary condition
        end
        fn(1) = 1; % Initial boundary condition when the plume is released 
        fn(n) = 0; % Final boundary condition when the plume is dispersed 
        f = fn;
        % In here we are not making the starting condition the samea as the final
%  hence for this reason we dont get symmetrical curves like in part
%  (a,b,c)
    end
time = nt*dt;
plot(x(1:n),f(1:n)) % plot graph
end
warning off
grid on
xlabel('Distance (m)');
ylabel('Concentration (c)')
legend('t = 0','t = 0.25','t = 0.5','t = 1','t = 2','t = 3')
title('Advection and Diffusion with Boundary Condition')
hold off