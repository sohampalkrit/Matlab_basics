% Define the time range for the reconstructed signal
t = -10:0.01:10;

% Define the frequency range and the frequency-domain function
omega = linspace(-5, 5, 100);
x = cos(omega) .* (omega >= -pi & omega <= pi);  % Frequency domain function

% Frequency step size
domega = omega(2) - omega(1);

% Initialize the inverse Fourier Transform result
X_reconstructed = zeros(size(t));

% Compute the inverse Fourier Transform to reconstruct the signal
for n = 1:length(t)
    % Reconstruct the signal at each time t(n)
    X_reconstructed(n) = (1 / (2 * pi)) * sum(x .* exp(1j * t(n) * omega)) * domega;
end

% Plot the magnitude and phase of the reconstructed signal
figure;
subplot(2, 1, 1);
plot(t, real(X_reconstructed), 'b');  % Plot the real part of the reconstructed signal
title('Reconstructed Signal (Real Part)');
xlabel('Time (t)');
ylabel('Reconstructed X(t)');
grid on;

subplot(2, 1, 2);
plot(t, imag(X_reconstructed), 'r');  % Plot the imaginary part of the reconstructed signal
title('Reconstructed Signal (Imaginary Part)');
xlabel('Time (t)');
ylabel('Imaginary Part of X(t)');
