clear; clf;

load data/Lab5Equal.mat

% include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function 
% of V1 − V2 for all three values of V2 that you used. (Yes, we are really 
% asking you to plot 12 curves on the same plot—the point is to be able to 
% visually compare the characteristics to see just how much they shift with 
% V2.)

% I1
hold on
plot(Ch1Vdm11, Ch2I111, 'r.')
plot(Ch1Vdm12, Ch2I112, 'g.')
plot(Ch1Vdm13, Ch2I113, 'b.')

% I2
plot(Ch1Vdm21, Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I123, 'b.')

% I1 - I2
plot(Ch1Vdm21, Ch2I111-Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I112-Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I113-Ch2I123, 'b.')


% I1 + I2
plot(Ch1Vdm21, Ch2I111+Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I112+Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I113+Ch2I123, 'b.')

title("Differential Pair Characteristics At Threshold (V_b = 0.5V)")
legend("4.5V", '3.5V', '2.5V', Location='southeast')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Current (A)')
%% 

% Also include a plot showing the common-source node voltage, V , as a 
% function of V1 − V2 for all three values of V2. How does the value of V 
% change as V1 goes from below V2 to above it?

clear; clf;

load data/exp1_WI.mat

hold on
plot(Ch1Vdm31, Ch2V31, '.')
plot(Ch1Vdm32, Ch2V32, '.')
plot(Ch1Vdm33, Ch2V33, '.')

legend('4.5 V', '3.5 V', '2.5 V')
title('Common-Source Node Voltage Below Threshold (V_b = 0.5 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Common-Source Node Voltage (V)')
%% Plot 1

% For each of the three values of V2 that you used, fit a straight line to 
% the plot of I1 − I2 as a function of V1 − V2 around the region where 
% V1 ≈ V2 (i.e., where V1 − V2 ≈ 0 V)

clear; clf;
load data/Lab5Equal.mat

[f1,l1,m1,b1,n1] = linefit(Ch1Vdm21, Ch2I111-Ch2I121, 5e-3);
[f2,l2,m2,b2,n2] = linefit(Ch1Vdm22, Ch2I112-Ch2I122, 5e-3);
[f3,l3,m3,b3,n3] = linefit(Ch1Vdm23, Ch2I113-Ch2I123, 5e-3);

Gdm_25 = m3;
Gdm_35 = m2;
Gdm_45 = m1;


hold on
% Plot Data
plot(Ch1Vdm23, Ch2I113-Ch2I123, 'b.')
plot(Ch1Vdm22, Ch2I112-Ch2I122, 'g.')
plot(Ch1Vdm21, Ch2I111-Ch2I121, 'r.')
% Plot Fit
plot(Ch1Vdm23, (Ch1Vdm23)*m3+b3, 'b-')
plot(Ch1Vdm22, (Ch1Vdm22)*m2+b2, 'g-')
plot(Ch1Vdm21, (Ch1Vdm21)*m1+b1, 'r-')

ylim([-1.5e-7 1.5e-7])

lgd = legend('2.5 V', '3.5 V', '4.5 V');
title(lgd,'V_2','FontSize',10)
xlabel("Differential-Mode Input Voltage (V)")
ylabel("I1-I2 (A)")

title('Current Difference At Threshold (V_b = 0.5 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('I_1-I_2 Current Difference (A)')

%% Plot 2

% Make plot similar to the ones that you made for the lower bias current. 
% How does the behavior of the circuit change as the bias current changes 
% from weak or moderate inversion to strong inversion?
clear; clf;
load data/exp1_SI.mat

figure(1)
hold on 
% I1
hold on
plot(Ch1Vdm11, Ch2I111, 'r.')
plot(Ch1Vdm12, Ch2I112, 'g.')
plot(Ch1Vdm13, Ch2I113, 'b.')

% I2
plot(Ch1Vdm21, Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I123, 'b.')

% I1 - I2
plot(Ch1Vdm21, Ch2I111-Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I112-Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I113-Ch2I123, 'b.')


% I1 + I2
plot(Ch1Vdm21, Ch2I111+Ch2I121, 'r.')
plot(Ch1Vdm22, Ch2I112+Ch2I122, 'g.')
plot(Ch1Vdm23, Ch2I113+Ch2I123, 'b.')


title("Differential Pair Characteristics Above Threshold (V_b = 0.8 V)")
legend("4.5V", '3.5V', '2.5V', Location='southeast')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Current (A)')

figure(2)
hold on
plot(Ch1Vdm31, Ch2V31, '.')
plot(Ch1Vdm32, Ch2V32, '.')
plot(Ch1Vdm33, Ch2V33, '.')

legend('4.5 V', '3.5 V', '2.5 V')
title('Common-Source Node Voltage Above Threshold (V_b = 0.8 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Common-Source Node Voltage (V)')
