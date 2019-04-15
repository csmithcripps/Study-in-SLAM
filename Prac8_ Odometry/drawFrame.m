function drawFrame(q)
    x = q(1);
    y = q(2);
    theta= q(3);
    r = 0.2;
    
    cx_x = x + r*cosd(theta);
    cx_y = y + r*sind(theta);
    cy_x = x + r*cosd(theta+90);
    cy_y = y + r*sind(theta+90);
    
    hold on 
    plot(x,y,'r*')
    hold on
    plot([x cx_x], [y cx_y],'r-')
    hold on
    plot([x cy_x], [y cy_y],'b-')
    
    drawnow
end
    