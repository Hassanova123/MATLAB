clear all;
clc;

A = 2; % cross-sectional area (m2)
taf1 = 0.1; % ?1 (min)
h = 0.01; %gap between grid points
t_final = 35; % final time
N = t_final/h; % Number of grid points

Kc1 = 1; % (m2/min), proportional gain
% initial condtions:
t1(1) = 0; % time
v1(1) = 2; % velocity 
x1(1) = 0; % delta h

for i = 1:N % number of iterations 
    t1(i+1) = t1(i)+h; % time at an interval
    x1(i+1) = x1(i)+h*(v1(i)); % delta h at an interval
    v1(i+1) = v1(i)+h*((-Kc1*v1(i)/A)-(Kc1/(taf1*A))*x1(i)); % 
end

Kc2 = 2; 
t2(1) = 0;
v2(1) = 2;
x2(1) = 0;

for i = 1:N
    t2(i+1) = t2(i)+h;
    x2(i+1) = x2(i)+h*(v2(i));
    v2(i+1) = v2(i)+h*((-Kc2*v2(i)/A)-(Kc2/(taf1*A))*x2(i));
end

Kc3 = 3;
t3(1) = 0;
v3(1) = 2;
x3(1) = 0;

for i = 1:N
    t3(i+1) = t3(i)+h;
    x3(i+1) = x3(i)+h*(v3(i));
    v3(i+1) = v3(i)+h*((-Kc3*v3(i)/A)-(Kc3/(taf1*A))*x3(i));
end

Kc4 = 4;
t4(1) = 0;
v4(1) = 2;
x4(1) = 0;

for i = 1:N
    t4(i+1) = t4(i)+h;
    x4(i+1) = x4(i)+h*(v4(i));
    v4(i+1) = v4(i)+h*((-Kc4*v4(i)/A)-(Kc4/(taf1*A))*x4(i));
end

Kc5 = 5;
t5(1) = 0;
v5(1) = 2;
x5(1) = 0;

for i = 1:N
    t5(i+1) = t5(i)+h;
    x5(i+1) = x5(i)+h*(v5(i));
    v5(i+1) = v5(i)+h*((-Kc5*v5(i)/A)-(Kc5/(taf1*A))*x5(i));
end


subplot(3,2,1)
plot(t1,x1,'r')
title('Kc = 1')
xlabel('Time(min)')
ylabel('delta h')
grid on
subplot(3,2,2)
plot( t2 ,x2, 'g')
title('Kc = 2')
xlabel('Time(min)')
ylabel('delta h')
grid on
subplot(3,2,3)
plot( t3, x3,'b')
title('Kc = 3')
xlabel('Time(min)')
ylabel('delta h')
grid on
subplot(3,2,4)
plot(t4, x4,'y')
title('Kc = 4')
xlabel('Time(min)')
ylabel('delta h')
grid on
subplot(3,2,5)
plot(t5, x5,'k')
title('Kc = 5')
xlabel('Time(min)')
ylabel('delta h')
grid on