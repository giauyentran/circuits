clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("exp1.mat")
load("exp2.mat")
load("exp3.mat")
load("exp4.mat")

% Experiment 1
figure(1)
hold on; grid minor;
xlim([-0.1, 1.1]);
ylim([-0.25*10^-3, 2.5*10^-3])
[f1, l1, m1, b1, n1] = linefit(Vsexp1, Currentexp1, 4e-5);
plot(linspace(-1,2,100), linspace(-1,2,100)*m1+b1, '-', color=bittersweet, LineWidth=1.5)
plot(Vsexp1, Currentexp1, '.', color=black, MarkerSize=7.5)
measured_resistance = 1/m1;

% Measured value: 499.14 \Omega
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
figure(4)

V2 = [Ib1(1,1), Ib2(1,1), Ib3(1,1), Ib4(1,1)]; % Vin = 2V
V3 = [Ib1(1,2), Ib2(1,2), Ib3(1,2), Ib4(1,2)]; % Vin = 3V
V4 = [Ib1(1,3), Ib2(1,3), Ib3(1,3), Ib4(1,3)]; % Vin = 4V
branches = [1,2,3,4];

semilogy(branches, -V2, '.', MarkerSize=30);
xlim([0.5,4.5])
ylim([5e-6,1.5e-4])
hold on; grid minor
% semilogy([1,2,3,4], -V3, '.', MarkerSize=15); %Vin = 3V omitted
semilogy([1,2,3,4], -V4, '.', MarkerSize=30);
V2_theoretical = [5e-5, 2.5e-5, 1.25e-5,6.25e-6];
V4_theoretical = [10e-5, 5e-5, 2.5e-5,1.25e-5];
semilogy(branches, V2_theoretical, 'k*', MarkerSize=10);
semilogy(branches, V4_theoretical, 'k*', MarkerSize=10);

legend('V_{in} = 2V', 'V_{in} = 4V', 'Theoretical')
title('Current through a R-2R Ladder Network')
ylabel('Current (A)')
xlabel('Branch Position')
yline(0, linewidth=1, color=black, HandleVisibility="off");
xline(0, linewidth=1, color=black, HandleVisibility="off");

hold off

