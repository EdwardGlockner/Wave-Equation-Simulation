function plot_snapshot_3D(dx,dy,dt,T,time,V)
    % dx - step
    % dt - time step
    % T - end time
    % time - time point the equation will be plotted
    % v - matrix of wave equation
    
    x = -1:dx:1;  % x vals
    y = -1:dy:1;
    t = 0:dt:T;   % t vals
    
    index = find(t>=time);
    index = index(1);
    
    [X,Y] = meshgrid(x,y);
    surf(X,Y,V(:,:,index));
    colormap(autumn(5))
    axis([-1 1 -1 1 -1 1]) % Set x-axis and y-axis
    xlabel("x position");
    ylabel("y position");
    title_prompt = ["Plot of the wave equation at t = " + time];
    title(title_prompt);
end