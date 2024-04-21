%% Part 1
clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load 

hold on
plot(Ch1VinExp22, Ch2VoutExp22, '.')

[f, l, m, b, n] = linefit(Ch1VinExp22(55:73), Ch2VoutExp22(55:73), 5.8e-3);
plot(Ch1VinExp22, Ch1VinExp22*m+b, '-')

ylim([2 5.5])
title('Voltage Transfer Characteristic')
xlabel('V_{dm} (V)')
ylabel('V_{out} (V)')
legend('Experimental Data', 'A_{dm} = 252.29', Location='southeast')
%% Part 2

clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load 

plot(Ch2VoutExp22, Ch2IoutExp22, '.')


[f,l,m,b,n] = linefit(Ch2VoutExp22(65:end), Ch2IoutExp22(65:end), 1);
hold on
plot(Ch2VoutExp22, Ch2VoutExp22*m+b)

title('Output Current-Voltage Characteristic')
ylabel('I_{out} (A)')
xlabel('V_{out} (V)')
legend('Experimental Data', 'R_{out} = 2.81e08 \Omega')

mhoout = m;
% 3.56e-09
rout = 1/mhoout;
% 2.40e08
plot(Ch2VoutExp22, Ch2VoutExp22*1/(rout/10)+b, 'b-')

% plot(Ch2VoutExp22, Ch1IoutExp22)

%% Part 3

clear; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load 

hold on
plot(Ch1VinExp23, -Ch2IoutExp23, '.')

[f, l, m, b, n] = linefit(Ch1VinExp23, -Ch2IoutExp23, 5e-3);
plot(Ch1VinExp23, Ch1VinExp23*m+b)

ylim([-2e-7 1.6e-6])
xlabel('V_{dm} (V)')
ylabel('I_{out} (A)')
title("Current-Voltage Characteristic")
legend('Experimental Data', 'G_m = 8.61e-06 S', Location='southeast')

%% 
clear
Gm = ;
rout = ;
Adm = Gm*rout;

