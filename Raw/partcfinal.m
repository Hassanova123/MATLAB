clear all;
clc;

D = 4*0.0254; % Inner Diameter of pipe (m)
R = D/2;
Ar = (pi*D^2)/4; % Area of the pipe (m2)
Q = (2000*42*(3.785*10^-3))/(24*60*60); % Volumetric flowrate (m3/s)
 
a = 0;
b = R;
n = 100;
x = linspace(a, b, n);
f = x.*((1-((x)/R).^2));

I_trap = trapz(x, f);
err_trap = 2 - I_trap;

uavg = Q/Ar;
r=linspace(-0.0508,0.0508,100);
umax = ((((uavg)*pi*(R)^2)/ (I_trap*2*pi)));
velocity = umax*(1-(r/R).^2);

plot(velocity,r)