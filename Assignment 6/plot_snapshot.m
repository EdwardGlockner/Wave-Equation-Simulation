function plot_snapshot(dx,dt,T,time,v)
    % dx - step
    % dt - time step
    % T - end time
    % time - time point the equation will be plotted
    % v - matrix of wave equation
    
    x = -1:dx:1;  % x vals
    t = 0:dt:T;   % t vals
    
    % Find index of the time point
    index = find(t>=time);
    index = index(1);
    
    plot(x,v(index,:));
    axis([-1 1 -1 1]) % Set x-axis and y-axis
    xlabel("x position");
    ylabel("y position");
    title_prompt = ["Plot of the wave equation at t = " + time];
    title(title_prompt);
end