import wave



if __name__ == '__main__':
	wav_file = wave.open('movinout.wav', mode='rb')
	wav_file.close()

	audio_channels = wav_file.getnchannels()
	print("Audio channels: " + str(audio_channels))
	# Returns number of audio channels (1 for mono, 2 for stereo).

	sample_width = wav_file.getsampwidth()
	print("Sample width: " + str(sample_width))

	Wave_read.readframes(n)

	print("All is good!\n")
