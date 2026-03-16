%% Signal Parameters
fs = 22050; % sampling frequency
A = 1; % amplitude
freq = 900; % frequency
phase = 0; % phase in radians
dur = 2; % duration in seconds

% Create a dummy signal (e.g., a sine wave)
t = 0:0.1:10;
x = sin(t);

% Add noise to signal 'x' to get an SNR of 10 dB
y = awgn(x, 10, 'measured');

%% Generate signal
[sig, t] = generate_sinusoid(fs, A, freq, phase, dur);

%% Plot signal
plot(t, sig);
xlabel("Time (s)");

%play signal
sound(y, fs);