clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("exp1_data.mat")
load("exp2_data.mat")
%% Compare the I/V and V/I Characteristics

figure(3); clf;

fitcv = fit(exp1_v_part2.', exp1_i_part2.', 'exp1');
fit_param_cv = coeffvalues(fitcv);
Is_cv = fit_param_cv(1);
Ut_cv = 1/fit_param_cv(2);

semilogy(exp1_v_part1,exp1_i_part1, '.', 'Color', bittersweet)
hold on;
semilogy(exp1_v_part2,exp1_i_part2, '.','Color',light_sea_green)
plot(fitcv, 'k-')

title('Diode Connected Transistor Characteristics')
xlabel('Voltage (V)')
ylabel('Current (A)')
legend('Voltage Current Characteristic', 'Current Voltage Characteristic', 'Curve Fit',location='northwest')

%% incremental resistance log-log plot
figure(4)
rd = diff(exp1_v_part1)./diff(exp1_i_part1);
loglog(exp1_i_part1(2:100), rd, '.', color=light_sea_green)
hold on;
% xlim([10e-10 10e-3])
loglog(exp1_i_part1, Ut_cv./exp1_i_part1, '-', color=bittersweet, LineWidth=1.5)
title('Incremental Resistance of Diode-Connected Transistor')
xlabel('Current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('Experimental Data','Theoretical Fit (r_d = U_T/I)')
