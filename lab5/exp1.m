% Run this section before running any other section
clear; clf;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;
%% 

clf;
load data/Lab5Equal.mat

% include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function 
% of V1 − V2 for all three values of V2 that you used. (Yes, we are really 
% asking you to plot 12 curves on the same plot—the point is to be able to 
% visually compare the characteristics to see just how much they shift with 
% V2.)

% I1
hold on; grid minor
plot(Ch1Vdm13, Ch2I113, '.', Color=black)
plot(Ch1Vdm12, Ch2I112, '.', Color=light_sea_green)
plot(Ch1Vdm11, Ch2I111, '.', Color=bittersweet)

% I2
plot(Ch1Vdm23, Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I121, '.', Color=bittersweet)

% I1 - I2
plot(Ch1Vdm23, Ch2I113-Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I112-Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I111-Ch2I121, '.', Color=bittersweet)


% I1 + I2
plot(Ch1Vdm23, Ch2I113+Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I112+Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I111+Ch2I121, '.', Color=bittersweet)

text(0,1.3e-7,'I_1+I_2')
text(-0.3,0.1e-7,'I_1')
text(0.3,0.1e-7,'I_2')
text(-0.3,-1.05e-7,'I_1-I_2')

title("Differential Pair Characteristics At Threshold (V_b = 0.5V)")
lgd = legend("2.5V", '3.5V', '4.5V', Location='southeast');
title(lgd,'V_2','FontSize',10)
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Current (A)')
%% 

% Also include a plot showing the common-source node voltage, V , as a 
% function of V1 − V2 for all three values of V2. How does the value of V 
% change as V1 goes from below V2 to above it?
clf;
load data/exp1_WI.mat

hold on; grid minor
plot(Ch1Vdm33, Ch2V33, '.', Color=black)
plot(Ch1Vdm32, Ch2V32, '.', Color=light_sea_green)
plot(Ch1Vdm31(21:121), Ch2V31(21:121), '.', Color=bittersweet)

ylim([1 4])
lgd = legend('2.5 V', '3.5 V', '4.5 V', Location = 'northwest');
title(lgd,'V_2','FontSize',10);
title('Common-Source Node Voltage At Threshold (V_b = 0.5 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Common-Source Node Voltage (V)')
%% Plot 1

% For each of the three values of V2 that you used, fit a straight line to 
% the plot of I1 − I2 as a function of V1 − V2 around the region where 
% V1 ≈ V2 (i.e., where V1 − V2 ≈ 0 V)

clf
load data/Lab5Equal.mat

[f1,l1,m1,b1,n1] = linefit(Ch1Vdm21, Ch2I111-Ch2I121, 5e-3);
[f2,l2,m2,b2,n2] = linefit(Ch1Vdm22, Ch2I112-Ch2I122, 5e-3);
[f3,l3,m3,b3,n3] = linefit(Ch1Vdm23, Ch2I113-Ch2I123, 5e-3);

Gdm_25 = m3;
Gdm_35 = m2;
Gdm_45 = m1;


hold on; grid minor
% Plot Data
plot(Ch1Vdm23, Ch2I113-Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I112-Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I111-Ch2I121, '.', Color=bittersweet)
% Plot Fit
plot(Ch1Vdm23, (Ch1Vdm23)*m3+b3, '-', Color=black)
plot(Ch1Vdm22, (Ch1Vdm22)*m2+b2, '-', Color=light_sea_green)
plot(Ch1Vdm21, (Ch1Vdm21)*m1+b1, '-', Color=bittersweet)

ylim([-1.5e-7 1.5e-7])

legend('V_2=2.5 V', 'V_2=3.5 V', 'V_2=4.5 V', 'G_{dm}=1.4512e-06 mhos', ...
    'G_{dm}=1.4764e-06 mhos', 'G_{dm}=1.5976e-06 mhos', Location="southeast");
xlabel("Differential-Mode Input Voltage (V)")
ylabel("I1-I2 (A)")

title('Current Difference At Threshold (V_b = 0.5 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('I_1-I_2 Current Difference (A)')

%% Plot 2

% Make plot similar to the ones that you made for the lower bias current. 
% How does the behavior of the circuit change as the bias current changes 
% from weak or moderate inversion to strong inversion?
clf;
load data/exp1_SI.mat

figure(1)
hold on; grid minor

% I1
plot(Ch1Vdm13, Ch2I113, '.', Color=black)
plot(Ch1Vdm12, Ch2I112, '.', Color=light_sea_green)
plot(Ch1Vdm11, Ch2I111, '.', Color=bittersweet)

% I2
plot(Ch1Vdm23, Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I121, '.', Color=bittersweet)

% I1 - I2
plot(Ch1Vdm23, Ch2I113-Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I112-Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I111-Ch2I121, '.', Color=bittersweet)


% I1 + I2
plot(Ch1Vdm21, Ch2I111+Ch2I121, '.', Color=black)
plot(Ch1Vdm22, Ch2I112+Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm23, Ch2I113+Ch2I123, '.', Color=bittersweet)


text(0,1.1e-5,'I_1+I_2')
text(-0.5,0.1e-5,'I_1')
text(0.5,0.1e-5,'I_2')
text(-0.5,-0.9e-5,'I_1-I_2')

ylim([-1.2e-5 1.2e-5])
title("Differential Pair Characteristics Above Threshold (V_b = 0.8 V)")
lgd = legend("2.5V", '3.5V', '4.5V', Location='southeast');
title(lgd,'V_2','FontSize',10)
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Current (A)')
%% 

clf;
load data/exp1_SI.mat

hold on; grid minor
plot(Ch1Vdm33, Ch2V33, '.', Color=black)
plot(Ch1Vdm32, Ch2V32, '.', Color=light_sea_green)
plot(Ch1Vdm31, Ch2V31, '.', Color=bittersweet)

lgd = legend('2.5 V', '3.5 V', '4.5 V', Location='northwest')
title(lgd,'V_2','FontSize',10)
title('Common-Source Node Voltage Above Threshold (V_b = 0.8 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('Common-Source Node Voltage (V)')
%% 
clf;
load data/exp1_SI.mat

figure(1)
hold on; grid minor

[f1,l1,m1,b1,n1] = linefit(Ch1Vdm21, Ch2I111-Ch2I121, 5e-3);
[f2,l2,m2,b2,n2] = linefit(Ch1Vdm22, Ch2I112-Ch2I122, 5e-3);
[f3,l3,m3,b3,n3] = linefit(Ch1Vdm23, Ch2I113-Ch2I123, 5e-3);

Gdm_25 = m3;
Gdm_35 = m2;
Gdm_45 = m1;

% I1 - I2
plot(Ch1Vdm23, Ch2I113-Ch2I123, '.', Color=black)
plot(Ch1Vdm22, Ch2I112-Ch2I122, '.', Color=light_sea_green)
plot(Ch1Vdm21, Ch2I111-Ch2I121, '.', Color=bittersweet)

% Fit
plot(Ch1Vdm23, (Ch1Vdm23)*m3+b3, '-', Color=black)
plot(Ch1Vdm22, (Ch1Vdm22)*m2+b2, '-', Color=light_sea_green)
plot(Ch1Vdm21, (Ch1Vdm21)*m1+b1, '-', Color=bittersweet)

ylim([-1.5e-5 1.5e-5])

legend('V_2=2.5 V', 'V_2=3.5 V', 'V_2=4.5 V', 'G_{dm}=6.0640e-05 mhos', ...
    'G_{dm}=6.2231e-05 mhos', 'G_{dm}=6.4787e-05 mhos', Location="southeast");
xlabel("Differential-Mode Input Voltage (V)")
ylabel("I1-I2 (A)")

title('Current Difference Above Threshold (V_b = 0.8 V)')
xlabel('Differential-Mode Input Voltage (V)')
ylabel('I_1-I_2 Current Difference (A)')
