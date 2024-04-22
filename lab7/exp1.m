clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load lab6_exp1.mat

hold on; grid minor
plot(exp1_ch1_V_2V5, exp1_ch2_V_2V5, '.', color=bittersweet)
plot(exp1_ch1_V_3V5, exp1_ch2_V_3V5, '.', color=light_sea_green)
plot(exp1_ch1_V_4V5, exp1_ch2_V_4V5, '.', color=black)

title('Voltage Transfer Characteristic')
xlabel('V_{in} (V)')
ylabel('V_{out} (V)')
lgd = legend('2.5 V', '3.5 V', '4.5 V', location='northwest');
title(lgd,'V_2','FontSize', 10)