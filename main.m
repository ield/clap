clear all;

filename = 'clap.wav';

%% Play the sound
% [y, fs] = audioread('clap.wav');
% soundsc(y, fs);

[clap, clapFFT, fs] = obtainFFT_audioFile(filename);

%% Geometry of the environment
d1 = 59.5:0.1:60.5;    % Distance to the wall [m]
d2 = 59.5:0.1:60.5;    % Distance to the wall [m]

% for ii = 1:length(d1)
%     for jj = ii:length(d2)
%         soundEcho(clap, fs, d1(ii), d2(jj));
%     end
% end

soundEcho(clap, fs, 60.4, 60.5);
