
R = 1; % Resistance in ohms
L = 0.1; % Inductance in Henry
h = 0.01; % Step size in seconds
T = 2; % Final time in seconds

% Initial conditions
t0 = 0; % Initial time
i0 = 0; % Initial current

% Time vector
t = t0:h:T;
n = length(t);

% Initialize current vector
i = zeros(1, n);
i(1) = i0;

% Define unit step input voltage v(t)
v = ones(1, n); % Unit step function (1 for all t >= 0)

% Forward Euler method loop
for k = 1:n-1
    di_dt = (v(k) - R * i(k)) / L;
    i(k+1) = i(k) + h * di_dt;
end

% Compute voltage across resistor and inductor
v_R = R * i;
v_L = v - v_R;

% Plot results
figure;
subplot(3,1,1);
plot(t, i);
xlabel('Time t (s)');
ylabel('Inductor Current i (A)');
title('Inductor Current using Forward Euler Method');
grid on;

subplot(3,1,2);
plot(t, v_R);
xlabel('Time t (s)');
ylabel('Voltage V_R (V)');
title('Voltage across Resistor');
grid on;

subplot(3,1,3);
plot(t, v_L);
xlabel('Time t (s)');
ylabel('Voltage V_L (V)');
title('Voltage across Inductor');
grid on;
