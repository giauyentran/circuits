clf; close all; clear;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;
pacific_cyan = [35 181 211]./255;

load("data/lab4_exp1_rev3.mat")


% min(IinExp1)
% max(IinExp1)



[exp1_nMOS1_V, exp1_nMOS1_I] = process_data(exp1_nMOS1_V, exp1_nMOS1_I);
[exp1_nMOS2_V, exp1_nMOS2_I] = process_data(exp1_nMOS2_V, exp1_nMOS2_I);
[exp1_nMOS3_V, exp1_nMOS3_I] = process_data(exp1_nMOS3_V, exp1_nMOS3_I);
[exp1_nMOS4_V, exp1_nMOS4_I] = process_data(exp1_nMOS4_V, exp1_nMOS4_I);
% Also, include a single semilog plot showing all four voltage-current characteristics along with one of
% the fits.
semilogy(exp1_nMOS1_V, exp1_nMOS1_I, ".", markerSize=5, color = taupe_gray)
hold on; grid minor
semilogy(exp1_nMOS2_V, exp1_nMOS2_I, ".", markerSize=5, color = bittersweet)
semilogy(exp1_nMOS3_V, exp1_nMOS3_I, ".", markerSize=5, color = light_sea_green)
semilogy(exp1_nMOS4_V, exp1_nMOS4_I, ".", markerSize=5, color = black)
title("nMOS Transistor Characteristics Fit to EKV Model")

% In your report, include a table showing the extracted EKV model parameters for each transistor.
[Is1, VT1, kappa1] = ekvfit(exp1_nMOS1_V, exp1_nMOS1_I, 5e-3, 'off');
[Is2, VT2, kappa2] = ekvfit(exp1_nMOS2_V, exp1_nMOS2_I, 5e-3, 'off');
[Is3, VT3, kappa3] = ekvfit(exp1_nMOS3_V, exp1_nMOS3_I, 5e-3, 'off');
[Is4, VT4, kappa4] = ekvfit(exp1_nMOS4_V, exp1_nMOS4_I, 5e-3, 'off');

% EKV model
V_g = linspace(0,5, 100);
I_sat = Is1 * (log(1 + exp((kappa1*(V_g - VT1) - 0)/(2*0.0258)))).^2;
semilogy(V_g, I_sat, color = pacific_cyan, linewidth = 1.5); xlim([0, 2.5]); ylim([1e-8, 1e-3]);
xlabel("Gate Voltage (V)"); ylabel("Saturation Current (A)")
legend_ = legend("#1", "#2", "#3", "#4", "EKV Fit", location="northwest");
title(legend_, "nMOS")

% Also, include a single semilog plot showing the difference between each transistor’s
% gate voltage and the average gate voltage from all four transistors as a function of input
% current.
figure(2)
semilogx(exp1_nMOS1_I, exp1_nMOS1_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.', color = taupe_gray)
hold on; grid minor; xlabel("Saturation Current (A)"); ylabel("Mean Gate Voltage Deviation (V)")
yline(0, color = black, linewidth = 1.5)
semilogx(exp1_nMOS2_I, exp1_nMOS2_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.', color = bittersweet)
semilogx(exp1_nMOS3_I, exp1_nMOS3_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.', color = light_sea_green)
semilogx(exp1_nMOS4_I, exp1_nMOS4_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.', color = black)
% semilogx(exp1_nMOS1_I, abs(exp1_nMOS1_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS2_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS3_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS4_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4), '.', color = pacific_cyan)
% xline(Is1, linewidth=1.5)
legend_ = legend("#1", "", "#2", "#3", "#4", location = "northwest")
title(legend_, "nMOS")
title("nMOS Transistor Mean Gate Voltage Deviation")

% How well do these characteristics match each other?
% Fairly well!

% Do the transistors generally match better at certain levels of inversion than others?
figure(3)
semilogx(exp1_nMOS1_I, exp1_nMOS1_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.-', color = taupe_gray)
hold on; grid minor; xlabel("Saturation Current (A)"); ylabel("Gate Voltage Deviation (V)")
yline(0, color = black, linewidth = 1.5)
semilogx(exp1_nMOS2_I, exp1_nMOS2_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.-', color = bittersweet)
semilogx(exp1_nMOS3_I, exp1_nMOS3_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.-', color = light_sea_green)
semilogx(exp1_nMOS4_I, exp1_nMOS4_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4, '.-', color = black)
semilogx(exp1_nMOS1_I, abs(exp1_nMOS1_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS2_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS3_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4) + abs(exp1_nMOS4_V - (exp1_nMOS1_V + exp1_nMOS2_V + exp1_nMOS3_V + exp1_nMOS4_V)/4), '.', color = pacific_cyan)
xline(Is1, linewidth=1.5)
legend_ = legend("I_s", "", "", "", "", "Total Abs Deviation", location = "northwest")
% title(legend_, "nMOS")
title("nMOS Transistor Gate Voltage Deviation from Mean")


% From one of your measured characteristics, extract that transistor’s incremental transcon-
% ductance gain.
figure(4);
gm = diff(exp1_nMOS1_I)./diff(exp1_nMOS1_V);
loglog(exp1_nMOS1_I(2:end), gm, '.', color = light_sea_green);
hold on;
gm_theo = kappa1 .* (sqrt(Is1 .* exp1_nMOS1_I))./(0.0258) .* (1 - exp(-sqrt(exp1_nMOS1_I./Is1)));
loglog(exp1_nMOS1_I, gm_theo, color = bittersweet, linewidth = 2);
hold on;  grid minor;
xlabel("Input Current (A)"); ylabel("Transconductance Gain (I/A)")
title("nMOS Transistor Characteristics")
legend("Measured Data", "Theoretical Fit")


% As you did in Labs 2 and 3, you should be able to use diff and ./ in MATLAB to obtain a crude finite-difference
% approximation to the partial derivative of the transistor’s saturation current with respect to its gate voltage.

% For your report, make a log-log plot showing the incremental transconductance gain of the transistor you selected as
% a function of the current flowing through it, along with a theoretical fit.

% Does the theoretical fit match the data?

% Interpolate data
function [v_g_out, I_sat_out] = process_data(v_g_in, I_sat_in)
    % v_g_out = [linspace(min(v_g_in), 1.1, 40), linspace(1.1, max(v_g_in), 60)];
    v_g_out = linspace(min(v_g_in), max(v_g_in), 150);
    I_sat_out = interp1(v_g_in, I_sat_in, v_g_out);
end
