%Define stereo sine wave parameters
Amp = 1;
Lf = 500;
Rf = 1000;
fs = 41000;
ts= 1/fs;
)%
t = 0:1/fs:(0.5-ts);
env = linspace(1, 0, length(t));
Lsig = Amp * sin(2*pi*Lf*t) .*env;
Rsig = Amp * sin(2*pi*Rf*t) .*env;
stereo = [Lsig', Rsig'];

%number of samples to plot
samples = 500;
%plot the left and right channels separately
figure;
subplot(2,1,1);
plot(t(1:samples), stereo(1:samples,1));
title('Left 500 Samples');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(2,1,2);
plot(t(1:samples), stereo(1:samples,2));
title('Right 500 Samples');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
%Swap left and rigth channels
swappedstereo = stereo(:, [2 1]);
%Reverse signal
reversedstereo = swappedstereo(end:-1:1, :);
%Convert to mono
mono = (reversedstereo(:,1) + reversedstereo(:,2)) / 2;
%play sound
soundsc(reversedstereo,fs);




%plot(t,sig);
%xlabel('Time (s)');
%ylabel('Amplitude');
%title('1000 Hz Sine Wave');
%grid on;
audiowrite('reversedswapped500Hz1000Hzsine.wav',stereo,fs);