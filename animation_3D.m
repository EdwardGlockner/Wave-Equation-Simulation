function animation_3D(T,dt,dx,dy,v,time1,time2)
    % T - end time
    % dt - time step
    % dx - step
    % v - matrix of wave equation
    % time1 - time point the animation will start
    % time2 - time point the animation will end
    
    t = 0:dt:T;   % t vals
    x = -1:dx:1;  % x vals
    y = -1:dy:1;
    
    index1 = find(t>=time1);
    index1 = index1(1);
    
    index2 = find(t>=time2);
    index2 = index2(1);
    
    vidObj = VideoWriter('video.avi');
    open(vidObj);

    for k = index1:index2
        [X,Y] = meshgrid(x,y);
        
        surf(X,Y,v(:,:,k),'FaceAlpha',0.5);
        
        axis([-1 1 -1 1 -1 1]) % Set x-axis and y-axis
        frame = getframe(gcf);
        writeVideo(vidObj,frame);
    end

    close(vidObj); 
end