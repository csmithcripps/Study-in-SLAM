% this simulator runs for 100 steps
clear variables
clf
load('reportData.mat')
addpath('../Robot_Functions')


nsteps = k/2;
idMap = [];
qSlam = [];
RealBeaconPos = [0.15,0.15;
                 0.89,0.15;
                 1.72,0.15;
                 0.40,1.75;
                 1.60,1.75];
     
R = diag([0.01 0.01*pi/180]).^2;

Q = diag([0.5 30*pi/180]).^2;

mu =    [q(1,1);q(1,2);q(1,3)]
S  =    diag([0.1 0.1 0.1*pi/180]).^2
% main loop
for k = 1:nsteps
   dTicks = o(k,:);
   [d,dth]  = encoderToPose(dTicks,mu(1:3));    
   % complete the prediction step in the body of the function below
   [mu,S] = predict_step(mu,S,d,dth,R);
   
    zStep = z(:,:,k);    
    for j = 1:5
        if zStep(j,1) == 0
            continue
        end
        if sum(idMap == zStep(j,1))
            rb = zStep(j,2:3);
            r = rb(1);
            b = rb(2);
            idNumber = find(idMap == zStep(j,1));
            [mu,S] = update_step(idNumber,[r;b],mu,S,Q);
        else
            rb = zStep(j,2:3);
            r = rb(1);
            b = rb(2);
            [mu,S] = initLandmarks([r;b],Q,mu,S);
            idMap = [idMap; zStep(j,1)];
        end
    end
%     hold on
%     plotSLAM(mu,S);
%     hold on
%     scatter(RealBeaconPos(:,1),RealBeaconPos(:,2),'r+')
%     hold on
%     plot(q(k,1),q(k,2),'g*')
    qSlam = [qSlam;mu(1:3)'];
end

hold on
plotSLAM(mu,S);
hold on
% scatter(RealBeaconPos(:,1),RealBeaconPos(:,2),'r+')
hold on
GTruth = plot(q(:,1),q(:,2),'r--');
hold on
SLAMOut = plot(qSlam(:,1),qSlam(:,2),'m');
legend([GTruth,SLAMOut],'Ground Truth', 'SLAM');






