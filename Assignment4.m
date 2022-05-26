clear variables; close all; clc;

% Given variables
m2 = [101,201,301,501]; % Grid points
m1 = [51,101,201,301];
T = 1.8; % End time
c = 1;   % Wave speed

% Analytical solution

uN = @(x,t) +0.5.*exp(-((x+2-c*t)./0.2).^2)+0.5.*exp(-((x-2+c*t)./0.2).^2);
uD = @(x,t) -0.5.*exp(-((x+2-c*t)./0.2).^2)-0.5.*exp(-((x-2+c*t)./0.2).^2);

qD = zeros(1, length(m1)); % Convergence rate for dirichlet boundary condition
qN = zeros(1, length(m1)); % Convergence rate for neumann boundary condition

error_m1_N = zeros(1,length(m1));
error_m2_N = zeros(1,length(m1));
error_m1_D = zeros(1,length(m1));
error_m2_D = zeros(1,length(m1));

norm_1_N = zeros(1,length(m1));
norm_2_N = zeros(1,length(m1));
norm_1_D = zeros(1,length(m1));
norm_2_D = zeros(1,length(m1));

% This for loop calculates the errors, l2 norm, and convergence rate
% for dirichlet and neumann boundary condition
for k = 1:length(m1)
 
    % Calculate x step
    dx_1 = 2/(m1(k)-1);
    dx_2 = 2/(m2(k)-1);
    
    % Calculate x values
    x1 = -1:dx_1:1;
    x2 = -1:dx_2:1;
    
    % Calculate t step
    dt_1 = 0.1*dx_1;
    dt_2 = 0.1*dx_2;
    
    % Calculate t values
    t1 = 0:dt_1:T;
    t2 = 0:dt_2:T;

    % Calculate the numerical solutions
    vD1 = RK4(m1(k), T, dx_1, dt_1, "D", c);
    vD2 = RK4(m2(k), T, dx_2, dt_2, "D", c);
    vN1 = RK4(m1(k), T, dx_1, dt_1, "N", c);
    vN2 = RK4(m2(k), T, dx_2, dt_2, "N", c);
    
    % Take the last row
    vD1 = vD1(length(t1), :);
    vD2 = vD2(length(t2), :);
    vN1 = vN1(length(t1), :);
    vN2 = vN2(length(t2), :);
    
    % Calculate the analytical solutions
    D = @(x) uD(x,T);
    N = @(x) uN(x,T);
    analytical_D_1 = D(x1);
    analytical_D_2 = D(x2);
    analytical_N_1 = N(x1);
    analytical_N_2 = N(x2);
    
    % Calculates the errors
    error_m1_N = abs(sum(analytical_N_1-vN1));
    error_m2_N = abs(sum(analytical_N_2-vN2));
    error_m1_D = abs(sum(analytical_D_1-vD1));
    error_m2_D = abs(sum(analytical_D_2-vD2));
    
    
    % Calculate the l2 norm
    l2_D_1 = sqrt(1/m1(k)) * norm(analytical_D_1-vD1);
    l2_D_2 = sqrt(1/m2(k)) * norm(analytical_D_2-vD2);
    l2_N_1 = sqrt(1/m1(k)) * norm(analytical_N_1-vN1);
    l2_N_2 = sqrt(1/m2(k)) * norm(analytical_N_2-vN2);
    
    % Save the norms
    norm_1_N(k) = l2_N_1;
    norm_2_N(k) = l2_N_2;
    norm_1_D(k) = l2_D_1;
    norm_2_D(k) = l2_D_2;
    
    % Calculate the convergence rates
    qD(k) = log10(l2_D_1/l2_D_2)/log10(m2(k)/m1(k));
    qN(k) = log10(l2_N_1/l2_N_2)/log10(m2(k)/m1(k));
end

