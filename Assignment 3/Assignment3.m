clear varibales; close all; clc;

% Set variables

m = 101;       % Grid points
T = 10000;     % End time
dx = 2/(m-1);  % Step
dt = 0.01;     % Time step
BC = "N";      % Boundary condition, "N" for Neumann and "D" for Dirichlet
c = 1;         % Wave speed

gamma_D = 3.0009;
gamma_N = 2.3053;

k_star_D = dx*2.8/(c*gamma_D);
k_star_N = dx*2.8/(c*gamma_N);

v = RK4(m, T, dx, dt, BC, c);

%animation(T,dt,dx,v,0,10)

plot_snapshot(dx,dt,T,1.8,v)