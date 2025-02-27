%% Test Multiple R and Q values
clear variables
close all
addpath('../Robot_Functions')
error = [0 0];


%% R dN

dN = [0.15, 0.1, 0.05, 0.01];

figure
for i =1:4
    subplot(2,2,i)
    title(["R dN=" + string(dN(i))])
    R1 = diag([dN(i) 1*pi/180]).^2;

    Q1 = diag([0.5 20*pi/180]).^2;
    hold on
    SimTest(R1,Q1,22);
    hold off
end


%% R thetaN value

thetaN = [1,5,10,25];

figure
for i =1:4
    subplot(2,2,i)
    title(["R thetaN=" + string(thetaN(i)) + '*pi/180'])
    R1 = diag([0.01 thetaN(i)*pi/180]).^2;

    Q1 = diag([0.5 20*pi/180]).^2;
    hold on
    SimTest(R1,Q1,22);
    hold off
end

%% Q dN

dN = [1, 0.5, 0.25, 0.1];

figure
for i =1:4
    subplot(2,2,i)
    title(["Q dN=" + string(dN(i))])
    R1 = diag([0.02 1*pi/180]).^2;

    Q1 = diag([dN(i) 15*pi/180]).^2;
    hold on
    SimTest(R1,Q1,30);
    hold off
end


%% Q thetaN value

thetaN = [30,15,10,5];

figure
for i =1:4
    subplot(2,2,i)
    title(["Q thetaN=" + string(thetaN(i)) + '*pi/180'])
    R1 = diag([0.01 1*pi/180]).^2;

    Q1 = diag([0.1 thetaN(i)*pi/180]).^2;
    hold on
    SimTest(R1,Q1,30);
    hold off
end















