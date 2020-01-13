function [pos vel] = simShipHW4(Kp, Ki, Kd, Fd)
    dt = 0.0001;
    Tf = 30;
    time = dt:dt:Tf;
    
    m = 1;
    c = 0.5;
    
    ref = 0;
    pos = 0;
    vel = 0;
    acc = 0;
    er = ref;
    er_old = er;
    der = 0;
    er_int = 0;
    
    for i = 1:length(time)
        er = ref - pos(i);         % error
        der = (er-er_old)/dt;      % derivative error
        er_int = er_int + er*dt;   % error Integral
        er_old = er;
        
        u = Kp*er + Kd*der + Ki*er_int;
        acc = (Fd(i)+u-vel(i)*c)/m;
        [pos(i+1) vel(i+1)] = moveShip(pos(i), vel(i), acc, dt);
    end
end      
 
% Euler Method to progress ship dynamics
function [x xdot] = moveShip(pos, vel, acc, dt)
    xdot = vel + acc*dt;
    x = pos + vel*dt + 0.5*acc*dt;
end