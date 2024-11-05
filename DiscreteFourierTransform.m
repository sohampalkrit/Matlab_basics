% Define the time vector
t = -10:10;  % Time range from -10 to 10 with step size 0.5

% Define the signal x(t)
x = t.*(t>=-4 & t<=4);  % Rectangular pulse, 1 between t = -1 and t = 1

% Define the frequency vector
omega = -10:0.1:10;  % Frequency range from -10 to 10 with step size 0.05

% Initialize the Fourier Transform result vector X
X = zeros(size(omega));  

% Compute the DTFT using matrix operations
for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * t));  % Calculate DTFT at each frequency omega(k)
end

% Plot the magnitude of the DTFT
figure;
subplot(2,1,1);
plot(omega, abs(X));
title('Magnitude');
xlabel('\omega');
ylabel('|X(\omega)|');
grid on;
subplot(2,1,2)
plot(omega, abs(angle(X)));
title('angle');
xlabel('\omega');
ylabel('ang(X(\omega))');

