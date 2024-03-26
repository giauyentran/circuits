clear all; clear; clf;
close all;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("Lab3exp2_4.9K.mat") % Likely 499
Ch1_I_49999 = Ch1Exp2Current;
Ch2_I_49999 = Ch2Exp2Current;
Ch1_V_49999 = Vexp2Ch1;
Ch2_V_49999 = Vexp2Ch2;

load("Lab3exp2_49.9K.mat") % Likely 4.9k
Ch1_I_499 = Ch1Exp2Current;
Ch2_I_499 = Ch2Exp2Current;
Ch1_V_499 = Vexp2Ch1;
Ch2_V_499 = Vexp2Ch2;

load("Lab3exp2_499K.mat") % Likely 49.9k
Ch1_I_4999 = Ch1Exp2Current;
Ch2_I_4999 = Ch2Exp2Current;
Ch1_V_4999 = Vexp2Ch1;
Ch2_V_4999 = Vexp2Ch2;

clear Ch1Exp2Current Ch2Exp2Current Vexp2Ch1 Vexp2Ch2

load("data/Lab3exp1.mat");

figure(1);
U_t = 0.0253;
beta = 170;
R_b_499 = U_t ./ Ch1_I_499 + 499*(1+beta);
I_s = 1.9530e-15;
collector_current_499 = Ch1_I_499 - Ch2_I_499;
collector_current_4999 = Ch1_I_4999 - Ch2_I_4999;
collector_current_49999 = Ch1_I_49999 - Ch2_I_49999;
semilogy(linspace(0,5,100), I_s * exp(linspace(0,5,100)/U_t), LineWidth = 1.5, color = taupe_gray);
hold on; grid minor;
semilogy(downsample(Ch1_V_499,5), downsample(collector_current_499,5), ".", MarkerSize = 7, color = light_sea_green)
semilogy(downsample(Ch1_V_4999,2), downsample(collector_current_4999,2), ".", MarkerSize = 7, color = bittersweet)
semilogy(downsample(Ch1_V_49999,2), downsample(collector_current_49999,2), ".", MarkerSize = 7, color = black)
xlim([0,5]); ylim([10^-10, 10^-2]);
% semilogy(downsample(Ch1_V_499,5), x)

title("Emitter-Degenerated Bipolar Characteristics")
xlabel("Base Voltage (V)"); ylabel("Collector Current (A)")
legend("Ideal Transistor, Exp 1", "R = 499\Omega", "R = 4.9k\Omega", "R = 49.9k\Omega", location = "southeast")
extracted_beta_499 = collector_current_499./Ch1_I_499;
extracted_beta_4999 = collector_current_4999./Ch1_I_4999;
extracted_beta_49999 = collector_current_49999./Ch1_I_49999;

figure(2); hold on; grid minor;
[f1, l1, m1, b1, n1] = linefit(Ch1_V_499, collector_current_499, 5e-4);
r_meas_499 = 1/m1;

plot(linspace(0,5,100), linspace(0,5,100)*m1 + b1, linewidth = 1.5, color = black)
plot(downsample(Ch1_V_499,5), downsample(collector_current_499,5), ".", MarkerSize = 9, color = light_sea_green)
title("Emitter Degenerated Bipolar Transistor Characteristics")
xlabel("Base Voltage (V)"); ylabel("Collector Current (A)")
legend("Fit: G_m (derived) = 2 x 10^{-3} A/V", "R = 499\Omega", location = "northwest")

figure(3); hold on; grid minor;
[f2, l2, m2, b2, n2] = linefit(Ch1_V_4999, collector_current_4999, 5e-4);
r_meas_4999 = 1/m2;
plot(linspace(0,5,100), linspace(0,5,100)*m2 + b2, linewidth = 1.5, color = black)
plot(downsample(Ch1_V_4999,3), downsample(collector_current_4999,3), ".", MarkerSize = 9, color = bittersweet)
title("Emitter Degenerated Bipolar Transistor Characteristics")
xlabel("Base Voltage (V)"); ylabel("Collector Current (A)")
legend("Fit: G_m (derived) = 1.98 x 10^{-4} A/V", "R = 4.9k\Omega", location = "northwest")
R_b_4999 = U_t ./ Ch1_I_4999 + 4999*(1+beta);

figure(4); hold on; grid minor;
[f3, l3, m3, b3, n3] = linefit(Ch1_V_49999, collector_current_49999, 5e-4);
r_meas_49999 = 1/m3;
plot(linspace(0,5,100), linspace(0,5,100)*m3 + b3, linewidth = 1.5, color = bittersweet)
plot(downsample(Ch1_V_49999,3), downsample(collector_current_49999,3), ".", MarkerSize = 9, color = black)
title("Emitter Degenerated Bipolar Transistor Characteristics")
xlabel("Base Voltage (V)"); ylabel("Collector Current (A)")
legend("Fit: G_m (derived) = 1.99 x 10^{-5} A/V", "R = 49.9k\Omega", location = "northwest")
R_b_49999 = U_t ./ Ch1_I_49999 + 49999*(1+beta);

figure(5);
loglog(Ch1_I_499, gradient(Ch1_V_499)./gradient(Ch1_I_499), ".", MarkerSize=7, color = light_sea_green);
hold on; grid minor;
loglog(Ch1_I_4999, gradient(Ch1_V_4999)./gradient(Ch1_I_4999), ".", MarkerSize=7, color = bittersweet);
loglog(Ch1_I_49999, gradient(Ch1_V_49999)./gradient(Ch1_I_49999), ".", MarkerSize=7, color = black);
loglog(Ch1_I_499, R_b_499, LineWidth = 0.5, color = light_sea_green);
loglog(Ch1_I_4999, R_b_4999, LineWidth = 0.5, color = bittersweet);
loglog(Ch1_I_49999, R_b_49999, LineWidth = 0.5, color = black);
xlabel("Base Current (A)"); ylabel("Incremental Resistance R_b (\Omega)");
title("Emitter Degenerated Bipolar Transistor Characteristics")
leg = legend("499", "4.9k", "49.9k");
title(leg, "R (\Omega)")
xlim([10^-12, 10^-4]); ylim([10^4, 10^10]);



figure(6);
G_m_499 = collector_current_499./(U_t + collector_current_499 * 499);
G_m_4999 = collector_current_4999./(U_t + collector_current_4999 * 4999);
G_m_49999 = collector_current_49999./(U_t + collector_current_49999 * 49999);
loglog(collector_current_499, gradient(collector_current_499)./gradient(Ch1_V_499), ".", MarkerSize=7, color = light_sea_green);
hold on; grid minor;
loglog(collector_current_4999, gradient(collector_current_4999)./gradient(Ch1_V_4999), ".", MarkerSize=7, color = bittersweet);
loglog(collector_current_49999, gradient(collector_current_49999)./gradient(Ch1_V_49999), ".", MarkerSize=7, color = black);
loglog(collector_current_499, G_m_499, LineWidth = 0.5, color = light_sea_green);
loglog(collector_current_4999, G_m_4999, LineWidth = 0.5, color = bittersweet);
loglog(collector_current_49999, G_m_49999, LineWidth = 0.5, color = black);
yline(m1, "--", color = light_sea_green);
yline(m2, "--", color = bittersweet);
yline(m3, "--", color = black);
xlabel("Collector Current (A)"); ylabel("Transconductance Gain (A/V)")
title("Emitter Degenerated Bipolar Transistor Characteristics")
leg = legend("499", "4.9k", "49.9k", location = "Northwest");
title(leg, "R (\Omega)");