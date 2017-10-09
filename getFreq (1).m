function [X_f, f] = getFreq(xs, n, Fs)
    % function [X_w, w] = getFreq(xs, n, Fs)
    % Gets the fourier transform of a discrete time signal xs
    % and plots the normalized magnitudes
    % Inputs:
    %       xs : snap of a signal 
    %       n : sample numbers
    %       Fs : Sampling frequency
    
Y = fft(xs);
L = length(n);

% Get the range of freq: max freq is Fs/2 <- sampling theorem
f = Fs/L * (0 : L/2);
% w = 2 * pi * f; 

X_f = abs(Y/L);
X_f = X_f(1 : L/2+1);

% Plot it
plot(f, X_f);
xlabel('Frequency (Hz)')
ylabel('Normalized X(f)')
xlim([0 6e3])
ylim([0 0.05])
return