clear; clf;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load data/lab4_exp2_rev2.mat

% In your report, include a log-log plot showing your current transfer 
% characteristic along with an appropriate theoretical fit. 

loglog(exp2_ch1_I, exp2_ch2_I, '.', Color=light_sea_green)
hold on
curvefit = fit(transpose(exp2_ch1_I), transpose(exp2_ch2_I), 'poly1');
fplot(@(x) x, linewidth = 1.5)
xlim([.95e-8 .0015])
axis equal
% m = 1.055, b = 8.035e-7

title("Current Transfer Characteristic")
xlabel("Input Current (A)")
ylabel("Output Current (A)")
legend("Experimental Data", "Theoretical Fit")

