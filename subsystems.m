function subsystems

%Number of eqns in each system: 5,1,3,1,8,5,4,2. 8 cases total.
%Color options: r,g,b,c,m,k.

% %System 1
% [t,x] = ode23s(@subsystem_eqns,[0 100],[0.01,0.01,0.01,0.01,0.01]);
% t = t*17/12;
% 
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% plot(t,x(:,2),'g')
% plot(t,x(:,3),'b')
% plot(t,x(:,4),'c')
% plot(t,x(:,5),'m')
% hold off

% System 2
% [t,x] = ode23s(@subsystem_eqns,[0 50],[0.1]);
% t = t*17/12;
% 
% figure(1)
% plot(t,x(:,1),'r')

% %System 3
% [t,x] = ode23s(@subsystem_eqns,[0 50],[0.1,0.1,0.1]);
% t = t*17/12;
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% plot(t,x(:,2),'g')
% plot(t,x(:,3),'b')
% hold off

% %System 4
% [t,x] = ode23s(@subsystem_eqns,[0 10],[0.5]);
% t = t*17/12;
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% hold off

%System 5
[t,x] = ode23s(@subsystem_eqns,[0 100],[0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1]);
t = t*17/12;
hold on
figure(1)
plot(t,x(:,1),'r')
plot(t,x(:,2),'g')
plot(t,x(:,3),'b')
plot(t,x(:,4),'c')
plot(t,x(:,5),'m')
plot(t,x(:,6),'r*')
plot(t,x(:,7),'g*')
plot(t,x(:,8),'b*')
hold off
% 
% %System 6
% [t,x] = ode23s(@subsystem_eqns,[0 50],[0.1,0.1,0.1,0.1,0.5]);
% t = t*17/12;
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% plot(t,x(:,2),'g')
% plot(t,x(:,3),'b')
% plot(t,x(:,4),'c')
% plot(t,x(:,5),'m')
% hold off

% %System 7
% [t,x] = ode23s(@subsystem_eqns,[0 50],[0.01,0.01,0.01,0.5]);
% t = t*17/12;
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% plot(t,x(:,2),'g')
% plot(t,x(:,3),'b')
% plot(t,x(:,4),'c')
% hold off

% %System 8
% [t,x] = ode23s(@subsystem_eqns,[0 50],[0.01,0.5]);
% t = t*17/12;
% hold on
% figure(1)
% plot(t,x(:,1),'r')
% plot(t,x(:,2),'g')
% hold off


function dx = subsystem_eqns(t,x)

e1 = 0.29;
k1 = 0.49;
k2 = 0.1;
k3 = 0.3;
k4 = 0.15;

GA1 = 1;
hNET = 0.457;
hSERT = 0.463;
hDAT = 1.22;

%Wake Specific 
%c = [0.1,0.001,0,0.001,0,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.001,0.001,0,0.1,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.001,0.1];
%c = [0.1,2.4,1.5,2.7,0.6,0.1,0.3,0.001,0.3,2,0.5,2.5,0.1,0.001,0.5,0.5,3,1,0.19,0.001,0.1,0.1,2,1,1,1,0.001,0.337,0.4,3,1,2,0.1,1,0.001,0.1]; 
%NREM Spec
%c = [12,1,0.1];% c = [2,0.5,0.5]; 
%Wake and REM
% c = [1,10,10,1,12,11,12,1/2,1/2,1,12,11,12,1/2,1/2,1]; 
%Wake Inclusive
c = [0.1,0.1,0.1,0.1,0.1,0.2,0.1,0.2,0.1,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.001,0.2,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.1,0.001,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.001,0.1];
% c = [1,10,10,1,2,2,1,2,1,10,1,1,10,1,1,1,10,1,2,1,12,11,12,1/2,1/2,1,12,11,12,1/2,1/2,11,2,1,10,10,0.5,0.043,1,1,1,10,10,0.5,0.037,1,1,2,0.39,10,10,0.39]; 
%Sleep Inclusive
% c = [1,10,10,1,12,1,0.1,12,11,12,1/2,1/2,1,12,11,12,1/2,1/2,1]; 
%REM Inclusive
% c = [1,10,10,1,12,11,12,1/2,1/2,1,12,11,12,1/2,1/2,1];  %[1.5,2,2,1/2,2,1,2,1/3,1/3,1/3,2,1,2,1/3,1/3,1/3]; 
%NREM Inclusive
% c = [12,1,0.1];% c = [2,0.5,0.5]; 
%REM and NREM
%a = [6,6,6,6,6];%[1/6,1/6,1/6,1/2,1/2]; %No less than 0.01*[]


% %Wake Specific
% %Coefficients of AD: c(6), c(13), c(19), c(26), c(34)
% %OX - W. 
% dx(1) = c(1)*0.1 + (c(2) - c(3))*x(3) + (c(4) - c(5))*x(1) + 3*c(6) - c(7)*x(4) - c(8)*0.1 - c(9);
% %H - W
% dx(2) = c(10)*x(1) + c(11)*x(3) + c(12)*0.1 + 3*c(13) - c(14)*0.1 - (c(15) - c(16))*x(2);
% %NA - W
% dx(3) = c(17)*x(1) + c(18)*0.1 + 3*c(19) - 0.1*c(20) - (c(21) + c(22))*x(3) - hNET*x(3);
% %S - W
% dx(4) = c(23)*x(1) + c(24)*x(2) + c(25)*x(3) + 3*c(26) - 0.1*c(27) - (c(28) + c(29))*x(4) - hSERT*x(4);
% %DA - W
% dx(5) = c(30)*x(1) + c(31)*x(4) + 0.1*c(32) - c(33)*x(3) + 3*c(34) - 0.1*c(35) - c(36)*x(5) - hDAT*x(5);


% % %NREM Specific
% %GABA_BFs - NREM
% dx(1) = c(1) - c(2) - c(3)*x(1) - GA1*x(1);


% %Wake and REM
% %GABA_BFw - W,REM
% dx(1) = c(1)*x(2) + c(2) - c(3) - c(4)*x(1) - GA1*x(1);
% %ACh_BF - W,REM
% dx(2) = c(5) + c(6) - c(7) - c(8) - c(9) - c(10)*x(2);
% %ACh_LDT/PPT - W,REM
% dx(3) = c(11) + c(12) - c(13) - c(14) - c(15) - c(16)*x(3);


% %REM and NREM
% %GABA_VLPO - NREM,REM
% dx(1) = 30.68 - a(1) - a(2) - a(3) - a(4) - a(5) - k3*x(1)  - GA1 + k4 + (x(1)^2);

% %*****Monoamine trouble #2 ******
%Still causing trouble after supressing GABA
% %Wake Inclusive
%GABA_BFw - W,REM
dx(1) = c(1)*x(4) + c(2)*x(2) + c(3)*3 - c(4)*x(1) - GA1*x(1);
%OX - W
dx(2) = c(5)*x(5) + (c(6) - c(7))*x(6) + (c(8) - c(9))*x(2) + c(10)*3 - c(11)*x(7) - c(13) - c(12)*.1;
%H - W
dx(3) = c(14)*x(2) + c(15)*x(6) + c(16)*x(4) + c(17)*3 - c(18)*0.1 - (c(19) - c(20))*x(3);
%ACh_BF - W,REM
dx(4) = c(21)*x(2) + c(22)*x(3) - c(23)*.1 - c(24)*x(7) - c(25) - c(26)*x(4);
%ACh_LDT/PPT - W,REM
dx(5) = c(27)*x(2) + c(28)*x(3) - c(29)*.1 - c(30)*x(6) - c(31)*x(7) - c(32)*x(5);
%NA - W
dx(6) = c(33)*x(2) + c(34)*x(4) + c(35)*3 - c(36)*0.1 - (c(37) + c(38))*x(6) - hNET*x(6);
%S - W
dx(7) = c(39)*x(2) + c(40)*x(3) + c(41)*x(6) + c(42)*3 - c(43)*0.1 - (c(44) + c(45))*x(7) - hSERT*x(7);
%DA - W
dx(8) = c(46)*x(2) + c(47)*x(7) + c(48)*x(5) - c(49)*x(6) + c(50)*3 - c(51)*0.1 - c(52)*x(8) - hDAT*x(8);


% %Sleep Inclusive
% %GABA_BFw - W,REM
% dx(1) = c(1)*x(3) + c(2) - c(3) - c(4)*x(1) - GA1*x(1);
% %GABA_BFs - NREM
% dx(2) = c(5) - c(6) - c(7)*x(2) - GA1*x(2);
% %ACh_BF - W,REM
% dx(3) = c(8) + c(9) - c(10) - c(11) - c(12)*x(2) - c(13)*x(3);
% %ACh_LDT/PPT - W,REM
% dx(4) = c(14) + c(15) - c(16) - c(17) - c(18) - c(19)*x(4);
% %GABA_VLPO - NREM,REM
% dx(5) = 30.68 - a(1) - a(2) - a(3) - a(4)*x(3) - a(5)*x(4) - k3*x(5)  - GA1 + k4 + (x(5)^2);


% %REM Inclusive
% %GABA_BFw - W,REM
% dx(1) = c(1)*x(2) + c(2) - c(3) - c(4)*x(1) - GA1*x(1);
% %ACh_BF - W,REM
% dx(2) = c(5) + c(6) - c(7) - c(8) - c(9) - c(10)*x(2);
% %ACh_LDT/PPT - W,REM
% dx(3) = c(11) + c(12) - c(13) - c(14) - c(15) - c(16)*x(3);
% %GABA_VLPO - NREM,REM
% dx(4) = 30.68 - a(1) - a(2) - a(3) - a(4)*x(2) - a(5)*x(3) - k3*x(4)  - GA1 + k4 + (x(4)^2);


% %NREM Inclusive (Sleep Specific)
% %GABA_BFs - NREM
% dx(1) = c(1) - c(2) - c(3)*x(1) - GA1*x(1);
% %GABA_VLPO - NREM,REM
% %dx(2) = 1.45 - a(1) - a(2) - a(3) - a(4) - a(5) - k3*x(2)  - GA1 + k4 + (x(2)^2);
% dx(2) = 30.68 - a(1) - a(2) - a(3) - a(4) - a(5) - k3*x(2)  - GA1 + k4 + (x(2)^2);

dx = dx';