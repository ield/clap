function obtainFFT(sound, fs, d1, d2)
    
    % First it is calculated the time duration of the experiment. It is
    % determined by the time the sound takes to go and return and the
    % reproduction of the echo. It exists the posibility in which the sound
    % is longer than the echo. This must be checked
    
    % Calculating the duration of the sound
    L = length(sound);
    
    % Calculating the duration of the echos
    % It is done knowing v = s/t
    v = 343.2;   % Sound speed in the air [m/s]
    tEcho1 = 2*d1 / v;
    tEcho2 = 2*d2 / v;
    
    % Defining the sound wave
    soundSamples = L + max([L ceil(tEcho1*fs) ceil(tEcho2*fs)]) + L;
    soundWave = zeros(1, soundSamples);
    
    %First sound: the first clap
    soundWave(1:L) = soundWave(1:L) + sound;
    
    %Second sound: first echo
    attEcho1 = 0.2;                 % Attenuation of the first echo
    beginEcho1 = ceil(tEcho1*fs);   % Beginning of the first echo
    
    soundWave(beginEcho1:beginEcho1+L-1) = soundWave(beginEcho1:beginEcho1+L-1)+ attEcho1*sound;
    
    %Second sound: second echo
    attEcho2 = 0.2;                 % Attenuation of the second echo
    beginEcho2 = ceil(tEcho2*fs);
    soundWave(beginEcho2:beginEcho2+L-1) = soundWave(beginEcho2:beginEcho2+L-1)+ attEcho2*sound;
    
    obtainFFT_soundWave(soundWave, fs, d1, d2);
end