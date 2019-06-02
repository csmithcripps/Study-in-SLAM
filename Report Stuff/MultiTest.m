%% Test Multiple R and Q values
clear variables
clf
addpath('../Robot_Functions')
error = [];

% Test 1
R = diag([0.01 0.01*pi/180]).^2;

Q = diag([0.5 30*pi/180]).^2;

error(1) = SimTest(R,Q);