% Define numerator and denominator of the transfer function
num = [1 -1]; % Corresponding to (s - 1)
den = [1 8 12]; % Corresponding to (s^2 + 8s + 12)

% Create the transfer function system
sys = tf(num, den);

% Display the poles of the system
poles = pole(sys);
disp('Poles of the system:');
disp(poles);

% BIBO Stability check
if all(real(poles) < 0)
    disp('The system is BIBO stable (Externally stable).');
else
    disp('The system is BIBO unstable (Externally unstable).');
end

% Plot the impulse response to visualize internal stability
figure;
impulse(sys);
title('Impulse Response of the System');

% Check for internal asymptotic, marginal, or unstable behavior
if all(real(poles) < 0)
    disp('The system is internally asymptotically stable.');
elseif any(real(poles) > 0)
    disp('The system is internally unstable.');
else
    disp('The system is marginally stable.');
end
