function playlist()

% copyfile ../../../Downloads/*.mp3 .;
files = dir('*.mp3');

for k = 1 : length(files)
   controlLights(files(k).name);
end

end
