function v = CD2(m,T,dx,dt,BC,c)

    [BD, BN] = FSBP4(m); % Discretisation matrix
    
    if BC == "D"
        B = BD;
    elseif BC == "N"
        B = BN;
    end
    x = -1:dx:1;  % x vals
    t = 0:dt:T;   % t vals
    
    % Initiate the solution matrix
    v = zeros(length(t),length(x));
    
    % Apply initial condition
    f = exp(-(x./0.2).^2)';
    v(1,:) = f;
    matrix = eye(m)+dt^(2)*c^(2)*0.5*B;
    v(2,:) = matrix*f;
    
    for i = 2:length(t)-1
        v(i+1,:) = dt^(2)*c^(2)*B*v(i,:)' + 2*v(i,:)' - v(i-1,:)';
    end
    
end