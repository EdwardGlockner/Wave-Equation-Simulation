clear variables; close all; clc;

% Define variables
c = 1;
m = 31;
[BD,BN] = FSBP4(m);

% Numerical calculation 
num_eig1 = 1i*abs(sqrt(eig(c^2*BD)))';
num_eig2 = -1i*abs(sqrt(eig(c^2*BD)))';

% Analytical calculation

lambda_pos = @(n) 1i*c*n*pi/2;
lambda_neg = @(n) -1i*c*n*pi/2;
n = 1:1:m;

ana_eig1 = lambda_pos(n);
ana_eig2 = lambda_neg(n);

% Calculate errors

error_pos = abs(fliplr(num_eig1)-ana_eig1);
error_neg = abs(fliplr(num_eig2)-ana_eig2);

% Visualize the results
figure(1)
hold on 

plot(num_eig1, "g*")
plot(num_eig2, "g*")
xlabel("Real axis")
ylabel("Imaginary axis")
title("Eigenvalues solved numerically")
hold off

figure(2)
hold on 
plot(ana_eig1, "bo")
plot(ana_eig2, "bo")
xlabel("Real axis")
ylabel("Imaginary axis")
title("Eigenvalues solved analytically")
hold off


