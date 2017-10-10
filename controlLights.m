function controlLights(filename, deltaN, plot)
    % function lag = controlLights(filename, deltaN, plot)
    %   plots frequency contents of a signal in snaps of deltaN samples
    %   time interval for each plot = deltaN / Fs
    %   F_s = 44100 Hz (standard for audio signals)
    %   Inputs:
    %       filename : audio file
    %       deltaN (optional) : number of samples per snap 
    %                           defaults to 10,000
    %       plot (optional) : plots X_f if 1, defaults to 10000
if nargin <  3
   deltaN = 10000;
end
if nargin < 4
    plot = 0;
end

obj = openSerialPort('/dev/tty.usbmodem1421');

[y, Fs] = audioread(filename);
[len, ~] = size(y);
y = (mean(y, 2))'; % take the average of all channels

% get the number of intervals, start counting interval edges at 0
numIntervals = ceil(len/deltaN); 

% last interval doesn't have deltaN samples
% pad y with zeros at the end
y = [y, zeros(1, numIntervals * deltaN - len)];
maxEnergy = 0;


for k = 1 : numIntervals
    tic
    n = (k - 1) * deltaN + 1 : k * deltaN;
    ys = y(n);
    if plot
        figure(1)
        set(gcf, 'Name', sprintf('%s',filename));
    end
    [Xs_f, f] = getFreq(ys, n, Fs, plot);
    if k == 1
        soundsc(y, Fs);
    end
    maxEnergy = sendData(obj, f, Xs_f, maxEnergy);
   % fprintf('For k = %g,
    if deltaN/Fs > toc
        pause(deltaN / Fs - toc)
    end
end

for i = 1 : 3
    fwrite(obj, 255);
end
fclose(obj);
