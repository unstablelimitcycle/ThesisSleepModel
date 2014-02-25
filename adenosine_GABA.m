function adenosine_GABA

% %Perturbed system, Brown Data - over 8 days, then recoup period
% %First, solve the system under normal, unperturbed conditions
% %  y0 = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01];
% %  t= linspace(0,1500,1501);
% %  x = MyShootRK4(y0,t,1500);
% %  t = t/6.5;
% [t,x]=ode45(@adenosine_GABA_eqns,[0 300],[0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01]);
% t = t*3/2;
% fid = fopen('unperturbeddat.txt','w');
% fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f\n',x');
% fclose(fid);
% [f,g] = size(t); 
% [f,r] = size(x);
% %now, experiment with forcing 
% V = load_perturbations;
% [a,b] = size(V);
% 
% %Initialize
% % y0 = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01];
% % t1 = linspace(0,1500,1501);
% % x = MyShootRK4(y0,[V(:,1) V(:,2)],1500);
% % t1 = t/6.5;
% [t1,x1]=ode45(@adenosine_GABA_eqns,[V(:,1) V(:,2)],[0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01]);
% t1 = t1*3/2;
% fid = fopen('initperturbeddat.txt','w');
% fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f\n',x1');
% fclose(fid);
% [f,g] = size(t1);
% [q,r] = size(x1);
% 
% for i = 3:40
% 
%     if mod(i,2) == 0
%         %even right index corresponds to a wake interval
%         %y0 = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01];
% %         t1 = linspace(0,1500,1501);
% %         x = MyShootRK4(y0,[V(:,i-1) V(:,i)],1500);
% %         t1 = t/6.5;
%         [t2,x2]=ode45(@adenosine_GABA_eqns,[V(:,i-1) V(:,i)],[x1(q,1),x1(q,2),x1(q,3),x1(q,4),x1(q,5),x1(q,6),x1(q,7),x1(q,8),x1(q,9),2,x1(q,11),x1(q,12),x1(q,13)]); 
%         t2 = t2*3/2;
%         %dx = adenosine_GABA_eqns(t2,x2);
%         fid = fopen('perturbeddat.txt','a');
%         fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f\n',x2');
%         fclose(fid);
%     else
%         %odd right index corresponds to a sleep interval
%         [t2,x2]=ode45(@adenosine_GABA_eqns,[V(:,i-1) V(:,i)],[x1(q,1),x1(q,2),x1(q,3),x1(q,4),x1(q,5),x1(q,6),x1(q,7),x1(q,8),x1(q,9),0.1,x1(q,11),x1(q,12),x1(q,13)]);
%         t2 = t2*3/2;
%         %dx = adenosine_GABA_eqns(t2,x2);
%         fid = fopen('perturbeddat.txt','a');
%         fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f %12.5f\n',x2');
%         fclose(fid);
%     end
%     t1 = [t1; t2];
%     [f,g] = size(t1);
%     x1 = [x1; x2];
%     [q,r] = size(x1);
% end
% 
% [t3,x3] = ode45(@adenosine_GABA_eqns,[V(:,40) 300],[x1(q,1),x1(q,2),x1(q,3),x1(q,4),x1(q,5),x1(q,6),x1(q,7),x1(q,8),x1(q,9),x1(q,10),x1(q,11),x1(q,12),x1(q,13)]); 
% t3 = t3*3/2;
% %fid = fopen('finperturbeddat.txt','w');
% %fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x3');
% %fclose(fid);
% t1 = [t1;t3];
% %t1 = t1/6.5;
% x1 = [x1;x3];

%%%%%%%%%%%%%%%%%%%% Basic Plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% hold on
% figure(1)
% plot(x1(:,11),x1(:,10))
% title('A-G Phase Plane - Perturbed','Fontsize',10);
% xlabel('GABA','Fontsize',8);
% ylabel('Adenosine','Fontsize',8);
% hold off

% figure(2)
% hold on
% plot(t,x(:,10),'r')
% plot(t,x(:,11),'b')
% legend('A = Adenosine','G = GABA')
% title('Slow Time System','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% figure(3)
% hold on
% plot(t1,x1(:,10),'r')
% plot(t1,x1(:,11),'b')
% legend('A = Adenosine','G = GABA')
% title('Slow Time System - Perturbed','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off

%%%%%%%%%%%%%%%%%%%%%% Perturbed Days vs. Normal Days %%%%%%%%%%%%%%%%%%%%%
% figure(4)
% hold on
% xlim([0 100])
% plot(t,x(:,10),'r')
% plot(t,x(:,11),'b')
% title('Sleep-Wake Cycle','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% figure(5)
% hold on
% xlim([0 100])
% plot(t1,x1(:,10),'r')
% plot(t1,x1(:,11),'b')
% title('Perturbed Sleep-Wake Cycle','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off

% figure(6)
% hold on
% xlim([200 450])
% ylim([0 4])
% plot(t,x(:,10),'r')
% plot(t,x(:,11),'b')
% title('Sleep-Wake Cycle','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% figure(7)
% hold on
% xlim([200 450])
% ylim([0 4])
% plot(t1,x1(:,10),'r')
% plot(t1,x1(:,11),'b')
% title('Perturbed Sleep-Wake Cycle','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% figure(5)
% hold on
% xlim([500 1000])
% plot(t,x(:,10),'r')
% plot(t,x(:,11),'b')
% title('Sleep-Wake Cycle','Fontsize',10);
% hold off
% 
% figure(6)
% hold on
% xlim([500 1000])
% plot(t1,x1(:,10),'r')
% plot(t1,x1(:,11),'b')
% title('Perturbed Sleep-Wake Cycle','Fontsize',10);
% hold off
% 
% figure(7)
% hold on
% xlim([1000 1500])
% plot(t,x(:,10),'r')
% plot(t,x(:,11),'b')
% title('Sleep-Wake Cycle','Fontsize',10);
% hold off

% figure(8)
% hold on
% xlim([1000 1500])
% plot(t1,x1(:,10),'r')
% plot(t1,x1(:,11),'b')
% title('Perturbed Sleep-Wake Cycle','Fontsize',10);
% hold off

% figure(3)
% hold on
% %xlim([1000 1500])
% plot(t1,x1(:,13),'g')
% title('REM-NREM Activity - Perturbed','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off

% hold on
% figure(8)
% plot(x1(:,12),x1(:,13))
% title('REM-NREM Phase Plane - Perturbed','Fontsize',10);
% xlabel('\ddot{R}','Fontsize',8);
% ylabel('\dot{R}','Fontsize',8);
% hold off
% 
% figure(9)
% hold on
% xlim([150 200])
% plot(t,x(:,9),'r')
% plot(t,x(:,10),'b')
% plot(t,x(:,12),'g')
% legend('A = Adenosine','G = GABA','R = REM Activity')
% title('REM-NREM Visualization - Perturbed','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%No orexin system
y0 = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01];
 t = linspace(0,1500,1501);
 x = MyShootRK4(y0,t,1500);
 t = t/6.5;
% 
% hold on
% figure(1)
% plot(x(11,:),x(10,:))
% title('A-G Phase Plane - No Orexin','Fontsize',10);
% xlabel('GABA','Fontsize',8);
% ylabel('Adenosine','Fontsize',8);
% hold off
% 
% figure(2)
% hold on
% plot(t,x(10,:),'r')
% plot(t,x(11,:),'b')
% legend('A = Adenosine','G = GABA')
% title('Slow Time System - No Orexin','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% hold on
% figure(3)
% plot(t,x(13,:),'g')
% title('REM-NREM Activity - No Orexin','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% hold on
% figure(4)
% plot(x(12,:),x(13,:))
% title('REM-NREM Phase Plane - No Orexin','Fontsize',10);
% hold off
% 
figure(1)
hold on
xlim([150 200])
plot(t,x(10,:),'r')
plot(t,x(11,:),'b')
plot(t,x(13,:),'k')
legend('A = Adenosine','G = GABA','R = REM Activity')
title('REM-NREM Visualization - No Orexin','Fontsize',10);
xlabel('Time t (hours)','Fontsize',8);
ylabel('Threshold Levels','Fontsize',8);
hold off
% 
% 
% M = 5;
% m = 100;
% G1 = linspace(0.001,M,m);
% %A2 = linspace(0.001,M,m);
% A1 = zeros(1,M+1);
% A2 = zeros(1,M+1);
% for i = 1:m
%     
%     A1(:,i) = 4.9/(1+10*(G1(:,i)^2));
%     A2(:,i) = 0.3*(G1(:,1) - 1)/(0.15 - G1(:,i)^2);
% end
% 
% figure(6)
% hold on
% ylim([0 3])
% xlim([0 3])
% plot(G1,A1,'r')
% plot(G1,A2,'b')
% plot(x(11,:),x(10,:),'g')
% legend('dAD/dt Nullcline','dGABA/dt Nullcline','Phase Curve')
% xlabel('GABA','Fontsize',10);
% ylabel('AD','Fontsize',10);
% hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Regular System
%  y0 = [0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.5,0.8,0.01,0.01];
%  t = linspace(0,200,201);
%  x = MyShootRK4(y0,t,200);
%  t = t/6.5;
% 
% hold on
% figure(1)
% plot(x(11,:),x(10,:))
% title('A-G Phase Plane','Fontsize',10);
% xlabel('GABA','Fontsize',8);
% ylabel('Adenosine','Fontsize',8);
% hold off
% 
% figure(2)
% hold on
% plot(t,x(10,:),'r')
% plot(t,x(11,:),'b')
% legend('A = Adenosine','G = GABA')
% title('Slow Time System','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% hold on
% figure(1)
% plot(t,x(13,:),'k')
% title('REM-NREM Activity','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% hold on
% figure(4)
% plot(x(12,:),x(13,:))
% title('REM-NREM Phase Plane','Fontsize',10);
% hold off
% 
% 
% figure(1)
% hold on
% xlim([100 150])
% plot(t,x(10,:),'r')
% plot(t,x(11,:),'b')
% plot(t,x(13,:),'k')
% legend('A = Adenosine','G = GABA','R = REM Activity')
% title('REM-NREM Visualization','Fontsize',10);
% xlabel('Time t (hours)','Fontsize',8);
% ylabel('Threshold Levels','Fontsize',8);
% hold off
% 
% 
% M = 5;
% m = 100;
% G1 = linspace(0.001,M,m);
% %A2 = linspace(0.001,M,m);
% A1 = zeros(1,M+1);
% A2 = zeros(1,M+1);
% for i = 1:m
%     
%     A1(:,i) = 4.9/(1+10*(G1(:,i)^2));
%     A2(:,i) = 0.3*(G1(:,1) - 1)/(0.15 - G1(:,i)^2);
% end
% 
% figure(6)
% hold on
% ylim([0 3])
% xlim([0 3])
% plot(G1,A1,'r')
% plot(G1,A2,'b')
% plot(x(11,:),x(10,:),'g')
% legend('dAD/dt Nullcline','dGABA/dt Nullcline','Phase Curve')
% xlabel('GABA','Fontsize',10);
% ylabel('AD','Fontsize',10);
% hold off

% hold on
% figure(7)
% plot(t,x(1,:),'r')
% legend('GABA_{BFw}')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off

% hold on
% figure(8)
% plot(t,x(2,:),'r')
% legend('GABA_{BFs}')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off

% hold on
% figure(9)
% plot(t,x(3,:),'r')
% legend('OX')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off
% 
% hold on
% figure(10)
% plot(t,x(4,:),'r')
% legend('H')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off

% hold on
% figure(11)
% plot(t,x(5,:),'r')
% legend('ACh_{BF}')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off
% 
% hold on
% figure(12)
% plot(t,x(6,:),'r')
% legend('ACh_{LDT/PPT}')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off

% hold on
% figure(13)
% plot(t,x(7,:),'r')
% legend('NA')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off
% 
% hold on
% figure(14)
% plot(t,x(8,:),'r')
% legend('S')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off
% 
% hold on
% figure(15)
% plot(t,x(9,:),'r')
% legend('DA')
% xlabel('Time (hours)','Fontsize',12);
% ylabel('Threshold Levels','Fontsize',12);
% hold off



