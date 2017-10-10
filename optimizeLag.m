deltaN = 1000 * (5:1:25);
filename = 'short.mp3';

lag = zeros(1, length(deltaN));

for k = 1 : length(deltaN)
   waitbar(k / length(deltaN), sprintf('%.2f percentage complete', ...
           100 * k / length(deltaN)));
   lag(k) = plotFrequencies(filename, deltaN(k));
   pause(2 * lag);
end

figure(100)
plot(deltaN, lag, '-k')
xlabel('deltaN (number of samples in each chunk)')
ylabel('Lag (seconds)')
title('Lag vs. deltaN')