clear variables; close all; clc;

% Set variables

m = 101;      % Grid points
T = 10000;    % End time
dt = 0.01;    % Time step
dx = 2/(m-1); % Step
BC = "N";     % Boundary condition
c = 1;        % Wave speed



v = CD2(m,T,dx,dt,BC,c);

%animation(T,dt,dx,v,0,10);
plot_snapshot(dx,dt,T,6,v)