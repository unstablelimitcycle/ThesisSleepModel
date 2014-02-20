function var_gamma_sleep_model

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System of equations
%Y'=-k(1-X/gamma)(Y-alpha)
%X'=c(1-Y/gamma)(X-alpha)
%A" -(Y-alpha)(A^2-1)A'+A=0
%initial conditions
%X(0)=alpha;Y(0)=1;gamma(0)=0;A(0)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%First, solve the system under normal, unperturbed conditions
[t,x]=ode23s(@stuff,[0 4000],[0.1,1,0.001,0.001,0]);
fid = fopen('unperturbeddat.txt','w');
fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x');
fclose(fid);
[f,g] = size(t); 
[f,r] = size(x);
%now, experiment with forcing 
V = load_perturbations;
[a,b] = size(V);

%initialize
[t1,x1]=ode23s(@stuff,[V(:,1) V(:,2)],[0.001,1,0.001,0.001,0]);
fid = fopen('initperturbeddat.txt','w');
fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x1');
fclose(fid);
[f,g] = size(t1);
[q,r] = size(x1);

for i = 3:55

    if mod(i,2) == 0
        %even right index corresponds to a wake interval
        [t2,x2]=ode23s(@stuff,[V(:,i-1) V(:,i)],[x1(q,1),2.5,x1(q,3),x1(q,4),x1(q,5)]); 
        dx = stuff(t2,x2);
        fid = fopen('perturbeddat.txt','a');
        fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x2');
        fclose(fid);
    else
        %odd right index corresponds to a sleep interval
        [t2,x2]=ode23s(@stuff,[V(:,i-1) V(:,i)],[x1(q,1),0.001,x1(q,3),x1(q,4),x1(q,5)]);
        dx = stuff(t2,x2);
        fid = fopen('perturbeddat.txt','a');
        fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x2');
        fclose(fid);
    end
    t1 = [t1; t2];
    
    [f,g] = size(t1);
    x1 = [x1; x2];
    [q,r] = size(x1);
end

[t3,x3] = ode23s(@stuff,[V(:,55) 4000],[x1(q,1),x1(q,2),x1(q,3),x1(q,4),x1(q,5)]); 
%fid = fopen('finperturbeddat.txt','w');
%fprintf(fid,'%12.5f %12.5f %12.5f %12.5f %12.5f\n',x3');
%fclose(fid);
t1 = [t1;t3];
x1 = [x1;x3];
% t1 = t1/100000;
% t = t/100000;


%%%Error computation and plot%%%
%  err = [];
%  for j = 30:40
%      temp = abs(x(j,1) - x1(j,1));
%      err = [err temp];
%  end
% 
% figure(6)
% loglog(err)
% 
% figure(7)
% plot(err)

% [M,N] = size(t);
% [O,P] = size(t1);
% 
% y1 = zeros(M,1);
% y2 = zeros(O,1);
% 
% for j = 1:M
%     y1(j,1) = 2.3/(1+exp(0.5*x(j,5)));
% end
% 
% for i = 1:O
%     y2(i,1) = 2.3/(1+exp(0.5*x1(i,5)));
% end


figure(1)
subplot(2,1,1)

hold on
plot(t1,x1(:,1),'r')
plot(t1,x1(:,2),'b')
%plot(t1,x1(:,3),'m')
%plot(t1,x1(:,5),'g')
% plot(t1,y2(:,1),'k')
title('Perturbed Theoretical System','Fontsize',12);
hold off

subplot(2,1,2)
hold on
plot(t,x(:,1),'r')
plot(t,x(:,2),'b')
%plot(t,x(:,3),'m')
%plot(t,x(:,5),'g')
% plot(t,y1(:,1),'k')
title('Normal Theoretical System','Fontsize',12);
legend('S = Sleep On','W = Sleep Off')
xlabel('Time (hours)','Fontsize',12);
ylabel('Threshold Levels','Fontsize',12);
hold off

figure(2)
subplot(2,1,1)
hold on
plot(t,x(:,5),'r')
title('Homeostatic Sleep Drive', 'Fontsize',12);
xlabel('Time (hours)','Fontsize',12);
ylabel('Threshold Level','Fontsize',12);
hold off

subplot(2,1,2)
hold on
plot(t1,x1(:,5),'r')
title('Homeostatic Sleep Drive, Perturbed', 'Fontsize',12);
xlabel('Time (hours)','Fontsize',12);
ylabel('Threshold Level','Fontsize',12);
hold off

figure(3)
subplot(2,1,1)
hold on
plot(x(:,1),x(:,2));
title('S-W Phase Plane: Unperturbed','Fontsize',10);
xlabel('W: Sleep-off mechanism','Fontsize',8);
ylabel('S: Sleep-on mechanism','Fontsize',8);
hold off

subplot(2,1,2)
hold on
plot(x1(:,1),x1(:,2));
title('S-W Phase Plane: Perturbed','Fontsize',10);
xlabel('W: Sleep-off mechanism','Fontsize',8);
ylabel('S: Sleep-on mechanism','Fontsize',8);
hold off

% figure(4)
% subplot(2,1,1)
% hold on
% plot(x(:,3),x(:,4))
% title('Unperturbed REM Activity Phase Plane','Fontsize',10)
% xlabel('R','Fontsize',8);
% ylabel('dR/dt','Fontsize',8);
% hold off
% 
% subplot(2,1,2)
% hold on
% plot(x1(:,3),x1(:,4))
% title('Perturbed REM Activity Phase Plane','Fontsize',10)
% xlabel('R','Fontsize',8);
% ylabel('dR/dt','Fontsize',8);
% hold off

function dx = stuff(t,x)
delta = 1; %memory parameter; no specific units yet
zeta = 1;
alpha = 2;

f = 12/(1 + 10*exp(0.5*x(5)));
% if f>.61
%     disp('Error computing f');
%     return
% end
a1 = 0.5;
a2 = 4.5;
a3 = 5;
a4 = 0.0063;
a5 = 50;


dx=zeros(5,1);
dx(1) = f - a1*x(1) - a2*x(2)*x(2)*x(1); %Sleep On - needs to be more responsive 
dx(2) = -a3*x(2) + a4*x(1) + a5*x(2)*x(2)*x(1); %Sleep Off
dx(3)=x(4);
if dx(2)<0
    aa = 0.01;
else
    aa = 1;
end 
dx(4)= -((x(1)-x(2))*(x(3)^2 - 1)+zeta*dx(2))*alpha*x(4)-aa*(0.1+(dx(2))^2)*x(3);
dx(5)=0.5*(x(3) + abs(x(3)))-delta*x(5);


