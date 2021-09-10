clear all;
clc;
close all;

% numerical grid
xlength = 2;  % time length on graph, (x-axis)
n = 500; % number of grid points
h = xlength/(n-1); % gap between grid points
x = zeros(1,n);

% set numerical & physical parameters
cfl = 0.9; % Courant–Friedrichs–Lewy
a = 1d0;
dt = h * cfl / a; % change in time
for time = [0 0.5 1]; % plume released at these time intervals
x = zeros (1,n);
fn = zeros (1,n);
fnlw = zeros (1,n);
f = zeros (1,n);
flw = zeros (1,n);
fnlf = zeros (1,n);
flf = zeros (1,n);
x(1) = 0D0;

% assigning values to array x(i)
for i=2:n; % 499 iterations
x(i)=x(i-1)+h;
end
for i = 1:n;
f(i) = 0.75*exp(-((x(i)-0.5)/0.1).^2); % distribution of conc. with time
flw(i) = 0.75*exp(-((x(i)-0.5)/0.1).^2);
flf(i) = 0.75*exp(-((x(i)-0.5)/0.1).^2);
end
nt = time/dt; % number of time intervals
for k = 1:nt 
for i = 2:n %first order upwind
flux = a * (f(i)-f(i-1));
fn(i) = f(i)-(dt/h)*flux;
end
fn(1) = fn(n);
f = fn;
for i = 2:n-1 %Lax-Wendroff
l0 = (dt/(2*h))* a * (flw(i+1)-flw(i-1));
h0 = (dt^2/(2*h^2))* a^2 * (flw(i+1)-(2*flw(i))+flw(i-1));
fnlw(i) = flw(i) - l0 + h0;
end
fnlw(1) = fn(n);
fnlw(n) = fn(1);
flw = fnlw;

for i = 2:n-1 %Lax-Friederich
    fnlf(i) = 0.5*(flf(i-1)+flf(i+1))-(dt/(2*h))*a*(flf(i+1)-flf(i-1));
end

% Boundary conditions
fnlf(i) = fn(i);
fnlf(n) = fnlf(1)
flf = fnlf;

end
hold on

% graph plot
subplot(3,1,1)
plot(x,f)
title('First Order Upwind')
xlabel('Time (t)')
ylabel('Concentration')
legend('t = 0','t = 0.5','t = 1')
shg
pause(dt)
hold on

subplot(3,1,2)
plot(x,flw)
title('Lax-Wendroff')
xlabel('Time (t)')
ylabel('Concentration')
legend('t = 0','t = 0.5','t = 1')
shg
pause(dt)

hold on
subplot(3,1,3)
plot(x,flf)
title('Lax-Friedrich')
xlabel('Time (t)')
ylabel('Concentration')
legend('t = 0','t = 0.5','t = 1')
shg
pause(dt)
end
