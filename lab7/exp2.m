%% Part 1
clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load lab6_exp2_part1.mat
exp2_ch1_V_2V5=exp2_ch1_V_2V5-2.5;

hold on; grid minor
plot(exp2_ch1_V_2V5, exp2_ch2_V_2V5, '.', color=light_sea_green)

[f, l, m, b, n] = linefit(exp2_ch1_V_2V5, exp2_ch2_V_2V5, 9e-4);
plot(exp2_ch1_V_2V5, exp2_ch1_V_2V5*m+b, '-', color=bittersweet, linewidth=1)

ylim([-.5 5.5])
title('Voltage Transfer Characteristic')
xlabel('V_{dm} (V)')
ylabel('V_{out} (V)')
legend('Experimental Data', 'A_{dm} = 487.72', Location='southeast')
%% Part 2

clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load Lab7exp22again.mat

hold on; grid minor
plot(Ch2VoutExp22, Ch2IoutExp22, '.', color=light_sea_green)
[f,l,m,b,n] = linefit(Ch2VoutExp22(30:end), Ch2IoutExp22(30:end), 5e-1);
plot(Ch2VoutExp22, Ch2VoutExp22*m+b, color=bittersweet, linewidth=1.5)
% 
xlim([-0.1 5])
title('Output Current-Voltage Characteristic')
ylabel('I_{out} (A)')
xlabel('V_{out} (V)')
legend('Experimental Data', 'R_{out} = 4.54e08 \Omega', location='southeast')
% 
mhoout = m;
% 2.2023e-09
rout = 1/mhoout;
% 4.5407e08
%% Part 3

clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load Lab7exp23.mat

hold on; grid minor
Ch1VdmExp23 = Ch1VdmExp23-2.5;
plot(Ch1VdmExp23, -Ch2IoutExp23, '.', color=light_sea_green)

[f, l, m, b, n] = linefit(Ch1VdmExp23, -Ch2IoutExp23, 3e-3);
plot(Ch1VdmExp23, Ch1VdmExp23*m+b, '-', color=bittersweet, linewidth=1.5)

ylim([-7e-8 5e-8])
xlabel('V_{dm} (V)')
ylabel('I_{out} (A)')
title("Current-Voltage Characteristic")
legend('Experimental Data', 'G_m = 6.57e-07 S', Location='southeast')

%% 
clear
Gm = 6.57e-07;
rout = 4.54e08;
Adm = Gm*rout;
% 298.3

ratio = 487.72/Adm

