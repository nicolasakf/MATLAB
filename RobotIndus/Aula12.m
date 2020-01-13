% Setting DH Parameters
a1 = 0; alpha1 = pi/2; d1 = 0.08916; theta1 = 0;
a2 = 0.425; alpha2 = 0; d2 = 0; theta2 = pi/2;
a3 = 0.39225; alpha3 = 0; d3 = 0; theta3 = 0;
a4 = 0; alpha4 = -pi/2; d4 = 0.10915; theta4 = -pi/2;
a5 = 0; alpha5 = pi/2; d5 = 0.09456; theta5 = 0;
a6 = 0; alpha6 = 0; d6 = 0.0823; theta6 = 0;
% Creating Individual Transformations
A1 = MyTransf(a1, alpha1, d1, theta1);
A2 = MyTransf(a2, alpha2, d2, theta2);
A3 = MyTransf(a3, alpha3, d3, theta3);
A4 = MyTransf(a4, alpha4, d4, theta4);
A5 = MyTransf(a5, alpha5, d5, theta5);
A6 = MyTransf(a6, alpha6, d6, theta6);
% Creating the Complete Homogeneous Transformation
R = A1*A2*A3*A4*A5*A6
% Function to create Individual Homogeneous Transformations
function H = MyTransf(a, alpha, d, theta)
H = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta); sin(theta)
cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta); 0 sin(alpha) cos(alpha) d; 0 0 0 1];
end