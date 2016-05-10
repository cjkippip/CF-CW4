% Computational Finance
% coursework 4

% run import_data
%% Question 1
k_Order=3;
num_Mon=240;
% construct AR(k) data
XandTarget=k_AR_data(k_Order,num_Mon,SP_Close);
X=XandTarget(:,1:k_Order);
target=XandTarget(:,k_Order+1);

% figure(1),clf,
% plot3(Y(:,2),Y(:,3),Y(:,1),'bo');
% title('AR(2)','FontSize',16)
% xlabel('Y_t-1','FontSize',13,'FontWeight','bold')
% ylabel('Y_t-2','FontSize',13,'FontWeight','bold')
% zlabel('Y','FontSize',13,'FontWeight','bold')
% grid on
% grid minor
% hold off

[mdl,~] = ar(SP_Close, k_Order,'ls');
variance=mdl.NoiseVariance;

theta=(X'*X)\X'*target;
target_Hat=X*theta;

residual=target-target_Hat;
variance2=var(residual);

%% Question 2
T=num_Mon-k_Order;
t=1:T;
q=1e-10; 
Q=q*diag([1 1 1]); % covariance of process
r=variance; 
R=r; % covariance of observation
% R=10000;

H=X;
F=diag([1 1 1]);

% true state
thetaV=ones(3,T);
for i=1:T
    thetaV(:,i)=theta;
end

% estimated state
theta_Hat=ones(3,T); 
theta_Hat(:,1)=[1;1;1];

% error matrix P
P=eye(3,3);
PM=ones(3,3,T);
PM(:,:,1)=P;

theta_Hat_Minus=ones(3,1);
I=eye(3);

% Kalman filter
for i = 2:T
    theta_Hat_Minus = F*theta_Hat(:,i-1);  
    Pminus = F*P*F'+Q;   
    
    z = target(i,:); % measurments
    r = z-H(i,:)*theta_Hat_Minus; % residual
    K = Pminus*H(i,:)'/(H(i,:)*Pminus*H(i,:)'+R); % gain
    
    theta_Hat(:,i) = theta_Hat_Minus+K*r; % estimated theta
    P = (I-K*H(i,:))*Pminus; 
    PM(:,:,i) = P; % store every P
end 
%%
figure(1),clf,
for k=1:3      
    subplot(3,1,k)    
    plot(t, thetaV(k,:), 'b-', t, theta_Hat(k,:), 'r-')
    if k==1
        title('KF estimate parameter','FontSize',15);
    end
    xlabel('Time','FontSize',13,'FontWeight','bold'); 
    ylabel('parameter','FontSize',13,'FontWeight','bold'); 
    legend({'ture','estimation'},...
        'Location','eastoutside','FontSize',11,'FontWeight','bold'); 
    grid on
    grid minor
end



























