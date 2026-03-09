Fs=10000; 
A=0.8; 
Ts=1/Fs; 
dur=1.5; 
t=0:Ts:dur; 
Theta=2*pi*(100+200*t+500*t.*t); 
chirpsig=A*sin(Theta); 
audiowrite('mychirp1.wav',chirpsig,Fs); 
soundsc(chirpsig, Fs);