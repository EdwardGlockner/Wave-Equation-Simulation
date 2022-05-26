clear variables; close all; clc;

% Define variables
c = 1;
m = 31;
[BD,BN] = FSBP4(m);
h = 2/(m-1);

% Numerical calculation 
num_eig1 = 1i*abs(sqrt(eig(c^2*BD))); % Dirichlet
num_eig2 = 1i*abs(sqrt(eig(c^2*BN))); % Neumann

% Find the biggest eigenvalue numerically
eig_max1 = max(abs(num_eig1));
eig_max2 = max(abs(num_eig2));

gamma1 = h*eig_max1/c;
gamma2 = h*eig_max2/c;

disp("Biggest gamma for Dirichlet using c = " + c + " and m = " + m + " is: "+ gamma1)
disp("Biggest gamma for Neumann using c = " + c + " and m = " + m + " is: "+ gamma2)