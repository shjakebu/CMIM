%Lecture 10 assignment Samu Kallio
clc;
clear all;
close all;
a = 0.1;
b = 0.2;
omega = 1;
tol = 1e-9;
u0 = [0;0.4]; %Setting starting points
udot0 = [-0.5;0.5];
t = linspace(0,1,101);
phidot = -1; %time derivative of pi/6+omega*t
thetaM = zeros(1,length(t));    %Defining vectors for values
thetadotM = zeros(1,length(t));
dM = zeros(1,length(t));
ddotM = zeros(1,length(t));
for i = 1:length(t) %Looping over time vector
    phi = pi/6+omega*t(i);
    F = @(u) constraint(u,a,b,phi); %Creating a function handle for F and J
    J = @(u) Jacob(u);
    [theta,d] = NR_solver(F, J, u0, tol); %NR solver call
    Fdot = @(udot) constraint_d(udot,a,b,phidot,theta,phi);
    Jdot = @(udot) Jacob_d(theta,b);
    [thetadot,ddot] = NR_solver(Fdot, Jdot, u0, tol); %Call with derivatives
    thetaM(i) = theta;  %Add iteration values to vectors for plotting
    thetadotM(i) = thetadot;
    dM(i) = d;
    ddotM(i) = ddot;
end
figure
subplot(2,1,1)
plot(t,thetaM)
title('theta (rad)')
ylabel('theta') 
xlabel('t') 
subplot(2,1,2)
plot(t,dM)
title('d (m)')
ylabel('d') 
xlabel('t') 
figure
subplot(2,1,1)
plot(t,thetadotM)
title('velocity theta (rad/s)')
ylabel('thetadot') 
xlabel('t') 
subplot(2,1,2)
plot(t,ddotM)
title('velocity d (m/s)')
ylabel('ddot') 
xlabel('t') 

function F = constraint(u,a,b,phi)  
    theta = u(1);
    d = u(2);
    F = [a*cos(phi)+b*cos(theta)-d
    a*sin(phi)-b*sin(theta)];
end

function J = Jacob(u)
    theta = u(1);
    J = [-sin(theta)/5, -1
    -cos(theta), 0];
end

function Fdot = constraint_d(udot,a,b,phidot,theta,phi)
    thetadot = udot(1);
    ddot = udot(2);
    Fdot = [-a*(phidot)*sin(phi)-b*thetadot*sin(theta)-ddot %Velocity derivative
    a*phidot*cos(phi)-b*thetadot*cos(theta)];   
end

function Jdot = Jacob_d(theta,b)
    Jdot=[-b*sin(theta), -1 %Jacobian of velocity derivative
        -b*cos(theta), 0];
end

function [theta,d] = NR_solver(F, J, x, tol) %NR solver function
    Fx = F(x);
    e = 1;
    Fx_norm = norm(Fx);
    while Fx_norm > tol
        delta = J(x)\-Fx;
        x = x+delta; %step forward with 
        Fx = F(x);
        Fx_norm = norm(Fx);
    end
    theta = x(1);
    d = x(2);
end
