error = 1;
tol = 10e-5;
a = -5; %the lower endpoint of the [a,b] interval
b = 5; %the higher endpoint of the [a,b] interval
% this script solves second order ODE using the shooting method based on
% the method used in lecture 7
% the idea here is to convert the 2nd order ODE to two first order ODE
%2nd order ODE
%d2y/dx2+2x.dy/dx=0
%dy/dx=w
%dw/dx=-2xw
%Version 1.0, 05/04/2019
clc; clear all 
format long
% this to set the range of x 
x0 = 0; % initial value
xf =10; %final value
% to define the step h 
h = (xf-x0)/100;
% we split the x range into h segments
x = x0:h:xf;% we have defined the segment 
y = zeros(1,length(x0:h:xf)) ;% this set an epmty colum of zeros 
y(1) = 1; % given 
y(length(y)) = 0; %given this is equivalent to yf

w = zeros(1,length(x0:h:xf)) ; % 

guess_1 = ( y(length(y))- y(1) )/ (xf-x0); % first guess, this the equation of a slope
guess_2 = 2 * ( y(length(y))- y(1) )/ (xf-x0); % first guess w'
A = 2;
T = 0.1;
Kc=1

for n=1:3
if n ==1 
    w(1) = guess_1;
end

if n ==2 
    w(1) = guess_2;
end

if n==3
    fprintf("results: %g, %g \n", [y_1, y_2]);
    fprintf("guesses: %g, %g \n", [guess_1, guess_2]);

    p = polyfit([y_1, y_2], [guess_1, guess_2], 1); 
    guess = polyval (p, 0);
    fprintf("interpolated guess: %g\n", guess);
    w(1) = guess; % interpolated guess 
end 

% this should be run three times: for guess_1, guess_2 and finally for
% guess 
for i = 1:length(y)-1
    y(i+1) = y(i) + w(i) * h; 
    w(i+1) = w(i)+h*((-Kc*w(i)/A)-(Kc/T*A)*x(i))
end

if n==1
    y_1 = y(length(y));
end 
if n==2
    y_2 = y(length(y));
end 



end 

plot(x,y) 
hold on 
% verification: 

%d2y/dx2+2x.dy/dx=0
any (gradient(gradient(y,h),h) + 2 * x .* gradient(y) == 0 ) % this will verify 
% x = 0 => y = 1 
y(1) 
% x = 10 => y = 0 
y(length(y))
