[sig, fs] = audioread("pluck.wav");
sig = sig(:,1);
%set delay parameters
delay = 0.225;
D = round(delay*fs);
numEchoes = 1;
%create array for echo response
h = zeros(1, D*numEchoes + 1);
h(1) = 1;

for k = 1:numEchoes
    h(k*D + 1) = decay^k;
end

ir = zeros(1, 44100);
ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7, 0.6, 0.5];


y=conv(sig, h);
subplot(211), plot(sig);
subplot(212), plot(y);
y = y / max(abs(y));
sound(y, fs);