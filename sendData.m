function maxEnergy = sendData(obj, f, X_f, maxEnergy)
    %   function sendData(obj, f, X_f)
    %   Inputs:
    %       obj : arduino object to write data to
    %       f : frequency
    %       X_f : fourier transform coefficients
    
f_cutoff = [0, ...
            1500, ...   % Red light upto
            3000, ...   % Green light upto
            6000];      % Blue light upto

energy = zeros(1,3);
for k = 1 : 3
    energy(k) = (sum ( X_f(f > f_cutoff(k) & f < f_cutoff(k + 1)) ))^2;
end

maxEnergy = max([maxEnergy, energy]);
[~, order] = sort(energy);

for k = 1 : 3
    % k = frequency band decided by f_cutoff
    energy(k) = (1 / find(order == k))^2 * energy(k);
    scale = 255 - round(energy(k)/maxEnergy * 255);
    fwrite(obj, scale);
end

return