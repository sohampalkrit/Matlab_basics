% Define the symbolic variable and function
syms t s
f = sin(t);  % Example function (you can replace this with any other function of t)

% Compute the Laplace Transform
F_s = laplace(f, t, s);

% Display the result
disp('Laplace Transform of f(t):');
disp(F_s);

% Define a range for plotting the Laplace Transform
s_vals = linspace(-5, 5, 100);  % Real parts of s for visualization
F_vals = subs(F_s, s, s_vals);   % Substitute values into the Laplace transform for plotting

% Plot the magnitude of the Laplace Transform
figure;
subplot(2,1,1);
plot(s_vals, abs(F_vals));
title('Magnitude of Laplace Transform');
xlabel('Real part of s');
ylabel('|F(s)|');
grid on;

% Plot the phase of the Laplace Transform
subplot(2,1,2);
plot(s_vals, angle(F_vals));
title('Phase of Laplace Transform');
xlabel('Real part of s');
ylabel('Phase of F(s)');
grid on;

% Inverse Laplace Transform to reconstruct the original signal
f_reconstructed = ilaplace(F_s, s, t);

% Define a time range for plotting the original and reconstructed signals
time_vals = linspace(0, 10, 100);  % Adjust the time range as needed

% Evaluate the original and reconstructed signals over the time range
original_signal = subs(f, t, time_vals);              % Original signal
reconstructed_signal = subs(f_reconstructed, t, time_vals);  % Reconstructed signal

% Plot the original and reconstructed signals
figure;
subplot(2,1,1);
fplot(f, [0, 10], 'b');  % Plot original function (time range 0 to 10)
title('Original Signal f(t)');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

subplot(2,1,2);
plot(time_vals, double(reconstructed_signal), 'r');  % Plot the reconstructed signal
title('Reconstructed Signal from Inverse Laplace Transform');
xlabel('Time (t)');
ylabel('Reconstructed f(t)');
