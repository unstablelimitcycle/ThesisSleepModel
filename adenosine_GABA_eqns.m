function dx = adenosine_GABA_eqns(t,x)


e1 = 0.3; %Between 0.29 and 0.32 - starts dipping below zero at 0.33, starts to spiral into fixed point at 0.28
k1 = 0.49; 
k2 = 0.1;
k3 = 0.3;
k4 = 0.15;

 GA1 = 1;
 hNET = 0.457;
 hSERT = 0.463;
 hDAT = 1.22;
 
 A = load('coefficients2.txt');
 dx = zeros(13,1);
 c = [A(4),A(2),A(3),A(1),A(53),A(52),A(51),A(7),A(8),A(9),-1,0,A(11),A(10),0.1,A(54),A(12),A(16),A(15),A(17),0.1,1,0,A(18),A(19),A(22),A(21),A(55),1,A(23),A(24),A(28),A(26),A(27),1,A(29),A(30),A(33),0.1,0.543,0,A(34),A(35),A(36),A(39),0.1,0.537,0,A(40),A(43),A(41),A(42),A(45),0.1,0.22,10^(-5),10^(-5),10^(-5),10^(-5),10^(-5)]; 
% % 
% % %Notes for whole equation set: 
% % %GABA_BFw = x(1)    %ACh_BF = x(5)        %DA = x(9)
% % %GABA_BFs = x(2)    %ACh_LDT/PPT = x(6)   %AD = x(10)
% % %OX = x(3)          %NA = x(7)            %GABA_VLPO = x(11)
% % %H = x(4)           %S = x(8)
% % 
% %Fast time system
%GABA_BFw - W,REM
dx(1) = c(1)*x(5) + c(2)*x(3) + c(3)*x(10) - c(4)*x(1) - GA1*x(1);
%GABA_BFs - NREM
dx(2) = -c(5)*x(10) - c(6)*x(7) - c(7)*x(2) - GA1*x(2)+ 0.1*x(11);
%OX - W
dx(3) = c(8)*x(6) + (c(9) - c(10))*x(7) + (c(11) - c(12))*x(3) + c(13)*x(10) - c(14)*x(8) - c(15)*x(11) - c(16)*x(2);
%H - W
dx(4) = c(17)*x(3) + c(18)*x(7) + c(19)*x(5) + c(20)*x(10) - c(21)*x(11) - (c(22) - c(23))*x(4);
%ACh_BF - W,REM
dx(5) = c(24)*x(3) + c(25)*x(4) + c(26)*x(10) - c(27)*x(8) - c(28)*x(2) - c(29)*x(5);
%ACh_LDT/PPT - W,REM
dx(6) = c(30)*x(3) + c(31)*x(4) + c(32)*x(10) - c(33)*x(7) - c(34)*x(8) - c(35)*x(6);
%NA - W
dx(7) = c(36)*x(3) + c(37)*x(5) + c(38)*x(10) - c(39)*x(11) - (c(40) + c(41))*x(7) - hNET*x(7);
%S - W
dx(8) = c(42)*x(3) + c(43)*x(4) + c(44)*x(7) + c(45)*x(10) - c(46)*x(11) - (c(47) + c(48))*x(8) - hSERT*x(8);
%DA - W
dx(9) = c(49)*x(3) + c(50)*x(8) + c(51)*x(6) - c(52)*x(7) + c(53)*x(10) - c(54)*x(11) - c(55)*x(9) - hDAT*x(9);
%AD - W
dx(10) = k1 - k2*x(10) - (x(11)^2)*x(10);
%GABA_VLPO - NREM,REM
dx(11) = -e1 - c(56)*x(9) - c(57)*x(7) - c(58)*x(8) - c(59)*x(5) - c(60)*x(6) - k3*x(11) + k4*x(10) + (x(11)^2)*x(10);
 
dx(12) = x(13);
dx(13) = -(1*(x(11)-x(10))*(x(12)^2 - 1.3) + 3*dx(10))*2*x(13) - (8 + dx(10)^2)*x(12);



% %Just 2 equation (slow time) system
% %AD
% dx(1) = k1 - k2*x(1) - (x(2)^2)*x(1);
% %GABA_VLPO
% dx(2) = -e1 - k3*x(2) + k4*x(1) + (x(2)^2)*x(1);

