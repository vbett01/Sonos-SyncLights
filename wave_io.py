import wave
from scipy.io import wavfile
import scipy
from matplotlib import pyplot as plt
import numpy as np
import math

def getFreq(xs, n, Fs):
	Y = scipy.fft(xs);
	L = len(n);

	print(list(range(0, 20)))
	f = Fs/L * float(list(range(0,L/2)))
	w = 2 * math.pi * f 

	X_f = math.abs(Y/L)

	# % Plot it
	plt.plot(f, X_f);
	plt.xlabel('Frequency (Hz)')
	plt.ylabel('Normalized X(f)')
	# plt.xlim([0 6e3])
	# plt.ylim([0 0.05])
	return

if __name__ == '__main__':
	deltaN = 10
	# Load the data and calculate the time of each sample
	samplerate, data = wavfile.read('movinout.wav')
	data_len = len(data)
	numIntervals = math.floor(data_len/deltaN)

	for k in range(0, numIntervals):
		n = range(k * deltaN, (k+1) * deltaN)
		ys = np.array(data[n])
		getFreq(ys, n, samplerate)

print("All is good!\n")
