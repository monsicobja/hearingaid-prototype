% Choice of parameters and plot illustration inversion of microphones

clc
clear 
close all

% Parameters:
N = [8 12 16 24 32];                        % Length of filter
D = linspace(0,10,11);                   % Delay
colors = hsv(length(D)).*0.8;               % Distribution of colours for delays

srate = 44100;
f_min = 500;
f_max = 4000;

% NOTE: Inversionfilter and equalized impulse responses are not saved druing
% for loop
[max_error_mic, v_irsens_df, v_h, v_entz]  = Calculation_inversion_mic(N, D, srate, f_min, f_max);


%% Plot max_error of mean over impulse responses
figure(1)
imagesc(mean(max_error_mic,3));colorbar
xlabel('Delay / samples'); set(gca ,'YTick' ,1:1:length(N),'YTickLabel' ,N )
ylabel('Length of filter')
title('max\_error for mean of impulse responses')


%% Plot max_error of worst impuls responses
figure(2)
imagesc(max(max_error_mic,[],3));colorbar
xlabel('Delay / samples'); set(gca ,'YTick' ,1:1:length(N),'YTickLabel' ,N )
ylabel('Length of filter')
title('max\_error for worst (maximum) microphone impuls response')


%% Plot max_error of mean + 2*std over impuls responses
figure
imagesc(mean(max_error_mic,3)+std(max_error_mic,[],3).*2);colorbar
xlabel('Delay / samples'); set(gca ,'YTick' ,1:1:length(N),'YTickLabel' ,N )
ylabel('Length of filter')
title('max\_error for mean + 2*std of impuls responses')