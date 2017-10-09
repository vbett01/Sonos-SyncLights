function plotFrequencies(filename, deltaN)
    %   function plotFrequencies(filename)
    %   plots frequency contents of a signal in snaps of deltaN samples
    %   time interval for each plot = deltaN * T_sampling
    %   T_sampling = 44100 Hz (standard for audio signals)
    %   Inputs:
    %       filename : audio file
    %       deltaN : number of samples per snap 
    
[y, Fs] = audioread(filename);
[len, ~] = size(y);
y = y(:, 1)'; % assume all channels are identical 

% get the number of intervals, start counting interval edges at 0
numIntervals = floor(len/deltaN); 

% last interval doesn't have deltaN samples
% pad y with zeros at the end
y = [y, zeros(1, deltaN - (len - numIntervals * deltaN))];

for k = 0 : numIntervals
    tic
    n = k * deltaN + 1 : (k+1) * deltaN;
    ys = y(n);
    figure(1)
    set(gcf, 'Name', sprintf('%s',filename));
    title(sprintf('Frequency contents of %s', filename))
    [Xs_f, f] = getFreq(ys, n, Fs);
    if deltaN/Fs > toc
        pause(deltaN / Fs - toc)
    end
    %%% USE Xs_f and f to control rgb 
end