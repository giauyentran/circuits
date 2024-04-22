clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

data = readtable('weforgotpower');
data = table2array(data);

range = 2199:4160;
time = data(:,1);
wave = data(:,2);
output = data(:,3);

hold on
plot(time, wave, '.', color = light_sea_green)
plot(time, output, '.', color = bittersweet)

ylim([2.3 2.7])
xlabel('Time (s)')
ylabel('Voltage (V)')
%% Finding time constant

rangedown = 2199:3185;
timedown = data(rangedown,1)+0.023145855469544;
wavedown = data(rangedown,2);
outputdown = data(rangedown,3);

rangeup = 3185:4155;
timeup = data(rangeup,1)+0.015376175469544;
waveup = data(rangeup,2);
outputup = data(rangeup,3);