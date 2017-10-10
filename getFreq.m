function [X_f, f] = getFreq(xs, n, Fs, plot)
    % function [X_w, w] = getFreq(xs, n, Fs)
    % Gets the fourier transform of a discrete time signal xs
    % and plots the normalized magnitudes
    % Inputs:
    %       xs : snap of a signal 
    %       n : sample numbers
    %       Fs : Sampling frequency
    %       plot (optional) : plots if 1
    
Y = fft(xs);
L = length(n);

% Get the range of freq: max freq is Fs/2 <- sampling theorem
f = Fs/L * (0 : L/2);

% the signal is normalized within -1 to 1 
% so the max any X_f can be is the length of the signal xs = L
X_f = abs(Y/L);
% Get normalized |X_f| for the frequency range in f
X_f = X_f(1 : L/2+1);

% Plot it
if plot 
    plot(f, X_f);
    xlabel('Frequency (Hz)')
    ylabel('Normalized X(f)')
    xlim([0 6e3])
    ylim([0 0.05])
end
return