clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

data = readtable('weforgotpower');
data = table2array(data);

rangedown = 2220:3185;
timedown = data(rangedown,1)+0.023145855469544;
wavedown = data(rangedown,2);
outputdown = data(rangedown,3)-data(3185,3);

rangeup = 3185:4155;
timeup = data(rangeup,1)+0.015376175469544;
waveup = data(rangeup,2);
outputup = data(rangeup,3)-data(3185,3);

range = 3500:4160; % to isolate nice portion
time = data(:,1);
wave = data(:,2);
output = data(:,3);

hold on; grid minor
plot(time, wave, '.', color = light_sea_green)
plot(time, output, '.', color = bittersweet)
plot(timedown+data(2199,1), .0949*exp(-timedown*920.6)+data(3185,3), '-', color = black, linewidth=1.5)
plot(timeup+data(3185,1), .0849*(1-exp(-timeup*594.5))+data(3185,3), 'b-', linewidth=1.5)

ylim([2.3 2.7])
title('50 mV Amplitude Square Wave Response')
xlabel('Time (s)')
ylabel('Voltage (V)')
legend('V_{in}', 'V_{out}', '\tau = 0.0017s', '\tau = 0.0011s')
%% Finding time constant

rangedown = 2199:3185;
timedown = data(rangedown,1)+0.023145855469544;
wavedown = data(rangedown,2);
outputdown = data(rangedown,3)-data(3185,3);

rangeup = 3185:4155;
timeup = data(rangeup,1)+0.015376175469544;
waveup = data(rangeup,2);
outputup = data(rangeup,3)-data(3185,3);

clf
hold on
plot(timedown, outputdown, 'r.')
plot(timeup, outputup, 'b.')
plot(timedown, .0949*exp(-timedown*920.6)+data(3185,3), 'r-')
plot(timeup, .0849*(1-exp(-timeup*594.5))+data(3185,3), 'b-')
tauup = 1/920.6;
taudown = 1/594.5;

%% 

Gm = 6.57e-07;
C = 1e-09;

tau = C/Gm;


