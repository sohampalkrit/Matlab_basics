n = (-2:10)'; % Define the discrete time range for the solution
y = [3;2 ; 1; zeros(length(n)-2, 1)]; % Predefine the output array with initial conditions
x = [0; 0; zeros(length(n)-2, 1)]; % Define the input array

% Iterative computation starts here
for k = 4:length(n) % Start from the third index
   y(k)=1.6*y(k-1) -0.8*y(k-2) -0.02*y(k-3)+x(k-3) ; % Update based on recurrence relation
end

% Plot the Zero-Input Response
figure;
stem(n, y);
title('Zero-Input Response');
xlabel('n');
ylabel('y[n]');

ylabel('y[n]');

%for finding impulse response 

% Define the number of samples
N = 20;

% Allocate an array for impulse response
h = zeros(1, N);

% Define initial conditions for the impulse response
h(1) = 1;  % Impulse at n = 0
h(2) = 0;  % h[-1] = 0 (assume initial condition)
h(3)=0;

% Compute impulse response iteratively
for n = 4:N
     x(n-3) = h(n)-1.6*h(n-1) + 0.8*h(n-2) +0.02*h(n-3) ;  % Based on the given recurrence relation
end

% Plot the impulse response
figure;
stem(0:N-1, h);
title('Impulse Response via Iteration');
xlabel('n');
ylabel('h[n]');

%finding zero-state response 

n = (-2:10)'; % Define the discrete time range for the solution
y1 = [0 ; 0 ;0; zeros(length(n)-2, 1)]; % Predefine the output array with initial conditions
x = [1; 1;1; ones(length(n)-2, 1)]; % Define the input array

% Iterative computation starts here
for k = 4:length(n) % Start from the third index
    x(k-3) = y1(k)-1.6*y1(k-1) + 0.8*y1(k-2) +0.02*y1(k-3) ; % Update based on recurrence relation
end

figure;
stem(n, y1);
title('Zero-state Response');
xlabel('n');
ylabel('y[n]');

ylabel('y[n]');

%total response
total_response=y+y1;
figure;
stem(n, total_response);
title('Total Response');
xlabel('n');
ylabel('y_{total}[n]');


