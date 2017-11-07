function [X_f, f] = getFreq(xs, n, Fs, plot)
    % function [X_w, w] = getFreq(xs, n, Fs)
    % Gets the fourier transform of a discrete time signal xs
    % and plots the spectrum
    % Inputs:
    %       xs : snap of a signal 
    %       n : sample numbers
    %       Fs : Sampling frequency
    %       plot (optional) : plots if 1

X_f = fft(xs);
L = length(n);

% Get the spectrum in the range 0 < f < Fs/2 
% max freq is Fs/2 <- sampling theorem
f = Fs/L * (0 : L/2);
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