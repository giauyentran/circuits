clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("exp1_data.mat")
load("exp2_data.mat")

% Experiment 1
figure(1)
hold on; grid minor;
semilogx(exp1_i_part1,exp1_i_part1, '.')
hold on
semilogx(exp1_i_part2,exp1_i_part2, '.')

title('Diode-Connected Transistor Characteristics')
xlabel('Current (A)')
ylabel("Voltage (V)")
%TODO: curve fit, theoretical fit, styling

%TODO: incremental resistance log-log plot

% Experiment 2
figure(2)
hold on; grid minor;
