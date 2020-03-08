function [audioFFT] = obtainFFT(file)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [audio, Fs] = audioread(file);
    audio = audio(35000:100000, 1);
    audio = transpose(audio);
    
    L = length(audio);
    
    audioFFT = fft(audio);
    
    audioFFT = abs(audioFFT / L);
    audioFFT = audioFFT(1:L/2 + 1);
    audioFFT(2:end-1) = 2*audioFFT(2:end-1);
    
    f = Fs*(0:(L/2))/L;
    
    figure;
    plot(audio);
    title('Palmas en tiempo');
    
    figure;
    plot(f, audioFFT);
    title('Palmas en frecuencia');
    xlabel('f [Hz]');
end

