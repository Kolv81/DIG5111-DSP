%import audio file
[sig, fs] = audioread("hang.mp3");
%normalize to peak amplitude 1
sig = sig / max(abs(sig));
%normalize to rms amplitude 0.5
rms = sqrt(mean(sig.^2));
sig = sig *(0.5/rms);
%fade duration (seconds)
fade_time = 2;
%number of samples in fade
fade_samples = round(fade_time * fs);
%create fade in (linear)
fade_in = linspace(0,1,fade_samples)';
%create fade out (logarithmic)
fade_out = logspace(0,-2,fade_samples)';
%apply fades
sig(1:fade_samples) = sig(1:fade_samples) .* fade_in;
sig(end-fade_samples+1:end) = sig(end-fade_samples+1:end) .* flipud(fade_out);
%reverse signal








%Calculate time
t = (0:length(sig)-1)/fs;
%set gain and offest
gain = 1.2;
offset = 0.1;
%add gain and offset
gainsig = sig * gain;
offsetsig = gainsig + offset;

%plot waveform
figure;
plot(t,sig);
title('waveform plot');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%play audio
sound(offsetsig, fs)