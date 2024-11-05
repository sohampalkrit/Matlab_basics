% Define the function
% f = @(t) exp(-t.^2);  % Example: Gaussian function
f = @(t) abs(t);
% Define the frequency range
w = linspace(-10,10,100000);  % Frequency range for Fourier Transform

% Define the time range
t = linspace(-10,10,1000);  % Time range for integration

% Compute the Fourier Transform using numerical integration
FT = zeros(1, length(w));  % Initialize the Fourier Transform
dt = t(2)-t(1);  % Time step for numerical integration

for k = 1:length(w)
    % Compute the Fourier Transform at each frequency w(k)
    FT(k) = sum(f(t) .* exp(-1i * w(k) * t)) * dt;
end

% Plot the result
figure;
plot(w, abs(FT));
xlabel('Frequency (rad/s)');
ylabel('|F(w)|');
title('Fourier Transform of the Continuous Function');
grid on;