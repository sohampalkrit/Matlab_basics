No = 32;                       % Number of points
n = 0:No-1;                   % Create an array of n from 0 to 31
Xn = [ones(1, 5), zeros(1, 23), ones(1, 4)]; % Input signal

% Initialize array to hold d_n values
dr = zeros(1, No);

% Compute d_n values
for r = 0:No-1
    dr(r+1) = sum(Xn .* exp(-1j * r * 2 * (pi / No) * n)) / No;
end

% Plot d_n vs n
figure;
subplot(2, 1, 1); % Create a 2-row, 1-column subplot
stem(n, abs(dr), 'filled'); % Use stem for discrete values
title('Magnitude of d_n vs n');
xlabel('n');
ylabel('|d_n|');
grid on;

% Calculate the summation graph
summation_graph = cumsum(abs(dr)); % Cumulative sum of |d_n|

% Plot summation graph
subplot(2, 1, 2);
plot(n, summation_graph, '-o'); % Use plot for continuous line with markers
title('Cumulative Sum of |d_n|');
xlabel('n');
ylabel('Cumulative Sum');
grid on;
