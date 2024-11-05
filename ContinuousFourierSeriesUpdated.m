% Parameters
wo = 1;
h = 0.001;
To = 2 * pi / wo;
t = 0:h:(To-h);
y=(1.*(t>=0 & t<=pi)+(-1).*(t>=pi & t<=2.*pi));
N = length(y);

% DC component (average value)
c0 = sum(y) / N;

% Initialize arrays for Fourier coefficients
aa = zeros(1, 25);
bb = zeros(1, 25);
dn = zeros(1, 25);
thetan = zeros(1, 25);

% Calculate Fourier coefficients and d_n values
for n = 1:25
    aa(n) = 2 * sum(y .* cos(n * wo * t)) / N;
    bb(n) = 2 * sum(y .* sin(n * wo * t)) / N;
    dn(n) = sqrt(aa(n)^2 + bb(n)^2) / 2;   % Magnitude of Fourier coefficients
    thetan(n) = atan2(-bb(n), aa(n));      % Phase of Fourier coefficients
end

% Plot d_n vs n
figure;
subplot(2,1,1);
stem(1:25, dn, 'filled');
title('Fourier Series Coefficients d_n');
xlabel('n');
ylabel('d_n');

% Reconstruct the signal using the Fourier series
y_reconstructed = c0 * ones(size(t)); % Start with DC component
for n = 1:25
    y_reconstructed = y_reconstructed + 2*dn(n) * cos(n * wo * t + thetan(n));
end

% Plot original and reconstructed signals
subplot(2,1,2);
plot(t, y, 'b', 'LineWidth', 1.5); hold on;
plot(t, y_reconstructed, 'r--', 'LineWidth', 1.5);
title('Original Signal and Fourier Series Reconstruction');
xlabel('Time t');
ylabel('Amplitude');
legend('Original Signal', 'Reconstructed Signal');