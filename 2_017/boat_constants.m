%{ 
ALL units in IS 
%}

% Motor Constants
Vr = 12; % reference voltage applied to motor armature
bm = 2e-5; % friction coef. of the motor
Wnl = 541.087; % angular vel. with no load
Tstall = 0.6143; % torque delivered in stall condition
Kb = Vr/Wnl; % counter-electromotive const.
Kt = Tstall/29.77; % torque const.
Ra = Kt*Vr/Tstall; % armature resistance
Jm = 4e-7; % rotor moment of inercia 

% Other System Constants
m = 19.3; % boat mass
Izz = 0.8501; % boat 'yaw moment of inercia'
bs = 8e-5; % friction coef. of the propeller shaft
Js = 1.43436e-7; % shaft moment of inercia
Jpp = 2.116068e-6; % propeller moment of inercia
J = Jm + Js + Jpp; % resultant "powertrain" moment of inercia
rho = 1030; % seawater density
D = 0.06; % propeller diameter
pitch = 0.0605; % propeller pitch
Jp = pitch/(2*pi*D); % propeller advance const.
PD = pitch/D; % propeller P/D ratio
% analysing the propeller characteristic curve we can find Kthr, Kq and eta
Kthr = 0.5; % propeller thrust coef.
Kq = 0.06; % propeller torque coef.

% Calculating and Adjusting Plant Constants
f = 80; % linearization factor (= reference speed chosen for linearization)
T = f*rho*D^4*Kthr; % propeller thrust (T)
bp = f*rho*D^5*Kq; % friction coef. of the propeller
b = bm + bp + bs; % resultant friction coef.

% Final Control Loop Constants
A = (Kt/(Ra*J))*(T);
B = (1/J)*(b + (Kt*Kb)/Ra);


