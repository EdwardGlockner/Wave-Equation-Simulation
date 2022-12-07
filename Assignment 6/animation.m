function animation(T,dt,dx,v,time1,time2)
    % T - end time
    % dt - time step
    % dx - step
    % v - matrix of wave equation
    % time1 - time point the animation will start
    % time2 - time point the animation will end
    
    t = 0:dt:T;   % t vals
    x = -1:dx:1;  % x vals
    
    % Find the index of the time points
    index1 = find(t>=time1);
    index1 = index1(1);
    
    index2 = find(t>=time2);
    index2 = index2(1);
    
    vidObj = VideoWriter('video.avi');
    open(vidObj);

    for k = index1:index2
        plot(x,v(k,:))
        axis([-1 1 -1.1 1.1]) % Set x-axis and y-axis
        xlabel('x position')
        ylabel('y position')
        title('Animation of the wave equation')
        frame = getframe(gcf);
        writeVideo(vidObj,frame);
    end

    close(vidObj); 
end