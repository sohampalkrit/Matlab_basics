% Given equation: y[n+2] - 0.6*y[n+1] + 0.16*y[n] = 0
% Initial conditions
y = zeros(1, 20);  % Allocate 20 samples
y(-1 + 3) = -25;   % Adjusting index for MATLAB (y[-1] is at index 2)
y(-2 + 3) = 0;     % y[-2] is at index 1

% Iterative solution for the homogeneous equation (zero-input response)
for n = 3:20  % Starting from n = 3, corresponding to y[0]
    y(n) = 0.6 * y(n-1) - 0.16 * y(n-2);  % Update based on the recurrence relation
end

% Plot the Zero-Input Response (homogeneous solution)
figure;
stem(0:19, y);
title('Zero-Input Response');
xlabel('n');
ylabel('y[n]');

% To find the Impulse Response
N = 20;

% Allocate an array for impulse response
h = zeros(1, N);

% Define initial conditions for the impulse response
h(1) = 1;  % Impulse at n = 0
h(2) = 0;  % h[-1] = 0 (assume initial condition)

% Compute impulse response iteratively
for n = 3:N
    h(n) = 0.6 * h(n-1) - 0.16 * h(n-2);  % Based on the given recurrence relation
end

% Plot the Impulse Response
figure;
stem(0:19, h);
%stem(0:19,impulse_response);
title('Impulse Response');
xlabel('n');
ylabel('h[n]');
% 
% Zero-State Response can be found by convolving the impulse response with an input
input_signal = zeros(1, 20);  % Example input signal
zero_state_response = conv(input_signal, impulse_response);
zero_state_response = zero_state_response(1:20);  % Truncate to 20 samples

% Plot the Zero-State Response
figure;
stem(0:19, zero_state_response);
title('Zero-State Response');
xlabel('n');
ylabel('y_{zs}[n]');

% Total Response (Sum of Zero-Input and Zero-State Responses)
total_response = y + zero_state_response;

% Plot the Total Response
figure;
stem(0:19, total_response);
title('Total Response');
xlabel('n');
ylabel('y_{total}[n]');
