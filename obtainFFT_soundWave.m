function [audio, absAudioFFT, Fs] = obtainFFT_soundWave(audio, Fs, d1, d2)
    
    L = length(audio);
    
    soundsc(audio, Fs); % Play the sound
    
    % Audio Fourier transform
    audioFFT = fft(audio);
    absAudioFFT = abs(audioFFT / L);
    
    % Select only half of the spectre
    absAudioFFT = absAudioFFT(1:L/2 + 1);
    absAudioFFT(2:end-1) = 2*absAudioFFT(2:end-1);
    
    figure('Color',[1 1 1]);
    % Set xaxis
    f = Fs*(0:(L/2))/L/1e3;
    t = (1:L)/Fs*1e3;
   
    text1 = num2str(d1);
    text2 = num2str(d2);
    
    subplot(2, 1, 1);
    plot(t, audio);
    title(text1);
    xlabel('t [ms]');
    xlim([0 t(end)]);
    
    subplot(2, 1, 2);
    plot(f, absAudioFFT);
    title(text2);
    xlabel('f [kHz]');
    xlim([0 f(end)]);
end

