% y0 = [2,-1]; 
% t = linspace (0, 10, 100);
% [t,y] = ode23(@fn3, t,y0);
% subplot(2,1,1)
% plot(t,y(:,1));

yn=[4,-8]
t = linspace (0, 10, 100);
[t,y] = ode23(@fn3, t,yn);
subplot(2,1,2)
plot(t,y(:,1));
% %  
% x=inline('(4.*cos(3*t).*exp(-2*t)).*(t>0)','t')
% g=inline('sin(3.*t).*(t>=0)','t')
% %convolution function 
% dtau = .005; %defines an incremental value for the convolution
% tau= -4:dtau:4; %defines the integrating ranges for the convolution.
% ti= 0; %initialising the index counter, i.e. pointer to the solution to DE in y
% tvec = -2:.1:5; %defines time range for the output presentation
% y=NaN*zeros(1,length(tvec)); %NAN is not a number (no value is defined as o/p)
% for t = tvec % Start of loop for convolution, here t is scalar value varies in loop
%  ti=ti+1; % incrementing the counter pointer for the solution to DE in y
%  xg= x(tau).* g(t-tau); % Multiplication of two signals
%  y(ti) = sum(xg.*dtau); % integration
%  subplot(2,1,1),plot(tau,(x(tau)),'k-',tau,g(t-tau),'k--',t,0,'ok');
% % This window is for the display of the overlap ranges of two signals
%  axis([tau(1) tau(end) -3 3]);
%  subplot(2,1,2),plot(tvec,y,'k',tvec(ti),y(ti),'ok'); % This window is for the display of output
%  axis([tau(1) tau(end) -3 3]);
%  drawnow; 
% end
% figure;
% plot(tvec,y);