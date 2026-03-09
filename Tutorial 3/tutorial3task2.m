[sig, fs] = audioread("pluck.wav");
[sig2, fs2] = audioread("Church.wav");
sig = sig(:,1);
sig2 = sig2(:,1);
y=conv(sig, sig2);
% mix control (0 = dry, 1 = wet)
mix = 0.3;

% pad dry signal
sig_padded = [sig; zeros(length(y)-length(sig),1)];

% combine signals
y_mix = (1-mix)*sig_padded + mix*y;
subplot(211), plot(sig);
subplot(212), plot(y);
soundsc(y_mix, fs);