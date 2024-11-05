% Generation of unit ramp discrete signal
n = 0:0.1:4;  % Range for the discrete signal (can be adjusted)
% M = 9;     % Amplitude range (scaling factor for ramp)

% Define the ramp signal instead of the rectangular signal
% Ramp signal definition: r(n) = n for n within the range [-M/2, M/2]
r = n.*(n>=0 & n<=4);  % Mask for values in the range
%x = (1).* r;                         % Apply mask to define the ramp
% Plot the ramp signal
figure;
subplot(2,1,1);
plot(n, r);
title('Discrete Ramp Signal');
xlabel('n');
ylabel('Amplitude');

% Demonstration of getting Fourier spectra using fft command
N = 1024;  % Length of FFT (change to 512, 256, etc., as desired)

% Padding the signal to match the length N for FFT computation
r_padded = [r zeros(1, N - length(r))];

% Compute the Fourier Transform of the ramp signal
X = fft(r_padded);

% Frequency vector for the FFT
omega = (-N/2:(N/2)-1) * 2 * pi / N;  % Frequency range from -π to π

% Plot the magnitude of the Fourier transform
subplot(2,1,2);
plot([omega-2*pi omega omega+2*pi], fftshift(abs([X X X])), 'r.-');
title('Magnitude of Fourier Transform of Discrete Ramp Signal');
xlabel('Frequency (ω)');
ylabel('Magnitude');

% Round to avoid computational errors (optional)
X = round(1000 * X) / 1000;

% Plot the phase of the Fourier transform
figure;
plot([omega-2*pi omega omega+2*pi], fftshift(angle([X X X])), 'k');
title('Phase of Fourier Transform of Discrete Ramp Signal');
xlabel('Frequency (ω)');
ylabel('Phase');
