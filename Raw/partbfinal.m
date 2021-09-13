clear all ; 
clc ; 
close all ;% good programming routine

c = {'b','g','r','c'}; % assigning color legends

x = linspace(5000, 100000, 50); % creating array of 200 points between -pi & pi
y = linspace(0.037, 0.037, 50) ; % returns an array the same size as x consisting of all zeros

hold on %retains the current plot and certain axes properties
%so that subsequent graphing commands add to the existing graph.

for n = 0:0.002:0.008 %loop – subject to next week’s class
    
y = (1./(-2.*log10(n./3.7+2.51./(x.*sqrt(y)))).^2);
plot(x,y)
end

plot (x, y, 'k')
grid on
title ('plot of friction factor Vs Re')
xlabel('x')
ylabel('y')