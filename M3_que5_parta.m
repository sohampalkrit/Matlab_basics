% Define time vector
t = -10:0.01:10; % Time vector from -10 to 10 with step size 0.01

% Define the two signals, x(t) and g(t)
% Example: x(t) is a sinusoidal wave, and g(t) is a rectangular pulse
x = sin(2*pi*t); % Sinusoidal signal
g = (t >=0); % Rectangular pulse between -1 and 1

% Plot the original signals
figure;
subplot(3,1,1);
plot(t, x);
title('x(t) = sin(2\pi t)');
xlabel('t');
ylabel('x(t)');
grid on;

subplot(3,1,2);
plot(t, g);
title('g(t) = Rectangular Pulse');
xlabel('t');
ylabel('g(t)');
grid on;

% Compute the convolution using conv function
c = conv(x, g, 'same') * 0.01; % 'same' to keep the same length as t, scale by time step

% Plot the convolution result
subplot(3,1,3);
plot(t, c);
title('c(t) = x(t) * g(t)');
xlabel('t');
ylabel('c(t)');
grid on;
