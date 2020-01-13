%% APS1 - Robotica Insdustrial

clc
clear all
load('APS1.mat')

%% Ex 3)

m_2r3 = m_1r3 * (m_1r2)^-1

%% Ex 4.i)

m_1h0 = (m_0h1)^-1

%% Ex 4.ii)

p0 = m_0h1 * p1