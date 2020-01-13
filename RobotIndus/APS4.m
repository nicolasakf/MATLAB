% APS 4 - Nicolas Fonteyne

import SerialLink
import ETS2.*

%% Minha resolucao

a1 = 0; alfa1 = pi/2; d1 = 0.08946; teta1 = 0;
a2 = 0.425; alfa2 = 0; d2 = 0; teta2 = pi/2;
a3 = 0.3922; alfa3 = 0; d3 = 0; teta3 = 0;
a4 = 0; alfa4 = -pi/2; d4 = 0.1091; teta4 = -pi/2;
a5 = 0; alfa5 = pi/2; d5 = 0.09465; teta5 = 0;
a6 = 0; alfa6 = 0; d6 = 0.0823; teta6 = 0;

A10 = MyTransf(a1, alfa1, d1, teta1);
A21 = MyTransf(a2, alfa2, d2, teta2);
A32 = MyTransf(a3, alfa3, d3, teta3);
A43 = MyTransf(a4, alfa4, d4, teta4);
A54 = MyTransf(a5, alfa5, d5, teta5);
A65 = MyTransf(a6, alfa6, d6, teta6);
A60 = A10*A21*A32*A43*A54*A65;
A60trans = A60(1:3,4);

A10 = (A10);
A20 = (A10*A21);
A30 = (A20*A32);
A40 = (A30*A43);
A50 = (A40*A54);

v1 = cross(A10(1:3,3), A10(1:3,4)-A60trans);
v2 = cross(A20(1:3,3), A20(1:3,4)-A60trans);
v3 = cross(A30(1:3,3), A30(1:3,4)-A60trans);
v4 = cross(A40(1:3,3), A40(1:3,4)-A60trans);
v5 = cross(A50(1:3,3), A50(1:3,4)-A60trans);
v6 = cross(A60(1:3,3), zeros(3,1));

J = [v1 v2 v3 v4 v5 v6; A10(1:3,3) A21(1:3,3) A32(1:3,3) A43(1:3,3) A54(1:3,3) A65(1:3,3)]

%% Resolucao Peter Coke

mdl_ur5;
Jt = ur5.jacob0(qr)