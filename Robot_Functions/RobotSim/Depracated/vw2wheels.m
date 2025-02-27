function wheelVel = vw2wheels(vw)
    % Inputs:
    % vw is the velocity vector (v, omega) in units of metres/s and radians/s
    % Return:
    % wheelVel is the wheel velocity vector (vleft, vright) each in the range -100 to +100 to achieve
    % this velocity   
    
    W = 0.16; % Lateral Wheel Spacing
    d = 0.065; % Wheel Diameter
    
    vdelta = vw(2) * W;
    vlinear = [-1,1;1,1] \ [vdelta ; 2 * vw(1)]; %[vl;vr]
    
    
    wheelVel = vlinear* ((60*2)/(pi*d));
    wheelVel(1) = min(max(wheelVel(1),-100),100);
    wheelVel(2) = min(max(wheelVel(2),-100),100);
    
    wheelVel = transpose(wheelVel);
end