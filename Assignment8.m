clear varibles; close all; clc;

% Set variables

m = 201;      % Grid points
dx = 2/(m-1); % x step
dy = 2/(m-1); % y step
c = 1;        % Tave speed
T = 10;       % Tnd time
dt = 0.001;   % Time step
t = 0:dt:T;   % Time values
BC = "N";     % Boundary condition


V = CD2_2D(m,T,dx,dy,dt,BC,c);


%animation_3D(T,dt,dx,dy,V,0,10)

%plot_snapshot_3D(dx,dy,dt,T,1.8,V)