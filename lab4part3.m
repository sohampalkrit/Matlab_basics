
% Given parameters
R = 1; % Resistance in ohms
C = 0.5; % Capacitance in Farads (derived from time constant tau = RC = 0.5s)
h = 0.05; % Step size in seconds
T = 2.5; % Final time in seconds

% Initial conditions
t0 = 0; % Initial time
vc0 = 0.5; % Initial capacitor voltage

% Time vector
t = t0:h:T;
n = length(t);

% Initialize capacitor voltage and current vectors
vc = zeros(1, n);
ic = zeros(1, n);
vc(1) = vc0;

% Define unit step input voltage v(t)
v = ones(1, n); % Unit step function (1 for all t >= 0)

% Forward Euler method loop
for k = 1:n-1
    ic(k) = (v(k) - vc(k)) / R; % Current through resistor and capacitor
    vc(k+1) = vc(k) + h * (ic(k) / C); % Voltage update using Euler's method
end
ic(n) = (v(n) - vc(n)) / R; % Compute final current value

% Plot results
figure;
subplot(2,1,1);
plot(t, vc);
xlabel('Time t (s)');
ylabel('Capacitor Voltage V_C (V)');
title('Capacitor Voltage using Forward Euler Method');
grid on;

subplot(2,1,2);
plot(t, ic);
xlabel('Time t (s)');
ylabel('Capacitor Current I_C (A)');
title('Current through Capacitor');
grid on;
