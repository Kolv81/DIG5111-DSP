[sig, fs] = audioread("pluck.wav");
delay = 0.3; %delay
D = round(delay*fs);

% Create the impulse response for the echo effect
h = zeros(1, fs * 2);
numEchoes = 6;
decay = 0.6; % attenuation
h(1) = 1;
for n = D+1:length(h)
    h(n) = decay * h(n-D);
end



ir = zeros(1, 44100);
ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7, 0.6, 0.5];


y=conv(sig, h);
subplot(211), plot(sig);
subplot(212), plot(y);
sound(y, fs);