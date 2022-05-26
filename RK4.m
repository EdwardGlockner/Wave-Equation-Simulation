function v = RK4(m,T,dx,dt,BC,c)
    % m - grid points
    % T - end time
    % dx - step
    % dt - time step
    % BC either "D" for Dirichlet or "N" for Neumann
    % c - wave speed

    [BD, BN] = FSBP4(m); % Discretisation matrix

    if BC == "D"
        A = [zeros(m,m), eye(m); c^2*BD, zeros(m,m)];
    elseif BC == "N"
        A = [zeros(m,m), eye(m); c^2*BN, zeros(m,m)];
    end
        
    x = -1:dx:1;  % x vals
    t = 0:dt:T;   % t vals

    % Initiate the solution matrixes
    % Number of rows are number of time values. Number of columns are number of x
    % values. Think of 1 row as a snapshot of the string
    
    v = zeros(length(t),length(x));
    w = zeros(length(t),length(x));

    % Apply initial condition

    v(1,:) = exp(-(x./0.2).^2);
    w(1,:) = 0;

    % Implementing RK4
    for i = 1:length(t)-1

        u = [v(i,:),w(i,:)].';

        w1 = func(A, u);
        w2 = func(A, u + dt*0.5*w1);
        w3 = func(A, u + dt*0.5*w2);
        w4 = func(A, u + dt*w3);
        
        u = u + dt*(w1 + 2*w2 + 2*w3 + w4)/6;

        v(i+1,:) = u(1:m).';
        w(i+1,:) = u(m+1:2*m).';
    end
end