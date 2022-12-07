function V = CD2_2D(m,T,dx,dy,dt,BC,c)

    [BD, BN] = FSBP4(m); % Discretisation matrix
    if BC == "D"
        B = sparse(BD);
    elseif BC == "N"
        B = sparse(BN);
    end

    x = -1:dx:1;
    y = -1:dy:1;
    t = 0:dt:T;

    % Initiate the discrete solution matrix 

    V = zeros(length(x), length(x), length(t));

    % Apply initial conditions

    f = @(x,y) exp(-100*(x.^(2)+y.^(2)));

    for b = 1:length(x)
        V(b,:,1) = sparse(f(x(b),y));
    end
    for i = 1:length(x)
        V(i,:,2) = sparse(dt^(2)*c^(2)*0.5*(B * f(x(i),y)' + transpose(f(x(i), y)*B'))' + f(x(i), y));
    end

    % Implement CD2 algorithm

    for k = 2:length(t)-1
        V(:,:,k+1) = sparse(2*V(:,:,k) - V(:,:,k-1) + c^(2)*dt^(2)*(B*V(:,:,k) + V(:,:,k)*transpose(B)));
    end

end
