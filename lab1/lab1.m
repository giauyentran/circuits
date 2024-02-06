clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("exp1.mat")
load("exp2.mat")

% Experiment 1
figure(1)
hold on; grid minor;
xlim([-0.1, 1.1]);
ylim([-0.25*10^-3, 2.5*10^-3])
[f1, l1, m1, b1, n1] = linefit(Vsexp1, Currentexp1, 4e-5);
plot(linspace(-1,2,100), linspace(-1,2,100)*m1+b1, '-', color=bittersweet, LineWidth=1.5)
plot(Vsexp1, Currentexp1, '.', color=black, MarkerSize=7.5)
measured_resistance = 1/m1;

% Measured value: 499.1 \Omega
title('Current Voltage Characteristic of 499 \Omega Resistor')
ylabel('Current (A)')
xlabel('Voltage (V)')
legend("Fit: 477.05 \Omega", "SMU Data")
yline(0, linewidth=1, color=black, HandleVisibility="off");
xline(0, linewidth=1, color=black, HandleVisibility="off");
measured_r = 1/m1; % ohms

% Experiment 2
figure(2)
hold on; grid minor
xlim([-0.1, 1.1]);
ylim([-0.1, 0.6])
[f2, l2, m2, b2, n2] = linefit(Vsexp2, Voutexp2, 4e-5);
plot(linspace(-1,2,100), linspace(-1,2,100)*m2+b2, '-', linewidth=1.5, color=bittersweet)
plot(Vsexp2, Voutexp2, '.', color=black, MarkerSize=7.5)
hold off

title('Voltage Transfer Characteristic of Voltage Divider')
xlabel('V_{in} (V)');
ylabel('V_{out} (V)');
legend("Fit: 0.507 Voltage Gain", "SMU Data")
yline(0, linewidth=1, color=black, HandleVisibility="off");
xline(0, linewidth=1, color=black, HandleVisibility="off");

divider_ratio = m2;

% Experiment 3



% Experiment 4

