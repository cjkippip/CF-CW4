%% price to return
% a1=[5;2;3;4;8;6;7];
% [a2,a3]=price2ret(a1);
%% flip array up to down
% a1=[1;2;3;4;5;6;7];
% a2=flipud(a1) ;
%%
% a1=[1;2;3;4];
% a2=[4;3;2;1];
% b1=a1./a2;
%%
% figure(1),clf,
% plot3(X(1:167,1),X(1:167,2),CX_BS(1:167),'o',...
%     'MarkerSize',8,'MarkerFaceColor','b');
% hold on
% plot3(X(168:334,1),X(168:334,2),CX_BS(168:334),'o',...
%     'MarkerSize',8,'MarkerFaceColor','r');
% plot3(X(335:501,1),X(335:501,2),CX_BS(335:501),'o',...
%     'MarkerSize',8,'MarkerFaceColor','m');
% plot3(X(502:668,1),X(502:668,2),CX_BS(502:668),'o',...
%     'MarkerSize',8,'MarkerFaceColor','g');
% plot3(X(669:835,1),X(669:835,2),CX_BS(669:835),'o',...
%     'MarkerSize',8,'MarkerFaceColor','y');
% legend({'2925','3025','3125','3225','3325'},...
%     'Location','eastoutside',...
%     'Orientation','vertical',...
%     'FontSize',13,'FontWeight','bold')
% mesh(x,y,CX);
% 
% title('Surface and BS scatter','FontSize',16)
% xlabel('S/X','FontSize',13,'FontWeight','bold')
% ylabel('T-t','FontSize',13,'FontWeight','bold')
% zlabel('C/X','FontSize',13,'FontWeight','bold')
% axis([0.82 1.15 0 0.7 -0.05 0.17]);
% grid on
% grid minor
% hold off
%%
% y = sin([1:300]') + 0.5*randn(300,1);
% y = iddata(y);
% mb = ar(y,4,'burg');
% mfb = ar(y,4);
%% luis
% [Ncols,NRow]=size(SP_Close);
% N2=Ncols-3;
% targets=SP_Close(4:Ncols,:);
% 
% for j=1:N2
%     X(j,1:3)=SP_Close(j:j+2,:);
% end
% 
% [m,ref1] = ar(SP_Close, 3,'ls');
% variance=m.NoiseVariance;
% 
% % w=X\targets;
% w2=(X'*X)\X'*targets;
% y=X*w;
%% autocorrelation and convolution [sin(x)]
% t=linspace(-2*pi,2*pi,1000);   
% x=sin(t);  
% x1=sin(-t); 
% [a,b]=xcorr(x,'unbiased');
% y=conv(x,x)/length(t); 
% 
% figure(1),clf,
% subplot(411);
% plot(t,x)  
% hold on
% plot(0,0,'ro')
% axis([-2*pi 2*pi -1 1]);
% grid on
% 
% subplot(412);
% plot(t,x1)  
% hold on
% plot(0,0,'ro')
% axis([-2*pi 2*pi -1 1]);
% grid on
% 
% subplot(413);
% plot(b,a)  
% hold on
% plot(0,0.5,'ro')
% grid on
% 
% subplot(414);
% plot(b,y)
% hold on
% plot(0,-0.5,'ro')
% grid on
%% autocorrelation and convolution [x^2]
% t=linspace(0,4,1000);   
% x=2.^t;  
% x1=2.^(-t); 
% [a,b]=xcorr(x,'unbiased');
% y=conv(x,x)/length(t); 
% 
% figure(1),clf,
% subplot(411);
% plot(t,x)  
% hold on
% plot(0,0,'ro')
% grid on
% 
% subplot(412);
% plot(t,x1)  
% hold on
% plot(0,0,'ro')
% grid on
% 
% subplot(413);
% plot(b,a)  
% hold on
% plot(0,0.5,'ro')
% grid on
% 
% subplot(414);
% plot(b,y)
% hold on
% plot(0,-0.5,'ro')
% grid on
%%
aa=[1 2 3 4 5];
bb=var(aa);




