clear; clf;

load data/Lab5Equal.mat

% include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function 
% of V1 − V2 for all three values of V2 that you used. (Yes, we are really 
% asking you to plot 12 curves on the same plot—the point is to be able to 
% visually compare the characteristics to see just how much they shift with 
% V2.) Do these current–voltage characteristics change significantly as V2 
% changes? 

% I1
hold on
plot(Ch2Vin11-Ch1Vdm11, Ch2I111, 'r.')
plot(Ch2Vin12-Ch1Vdm12, Ch2I112, 'g.')
plot(Ch2Vin13-Ch1Vdm13, Ch2I113, 'b.')

% I2
plot(Ch2Vin21-Ch1Vdm21, Ch2I121, 'r.')
plot(Ch2Vin22-Ch1Vdm22, Ch2I122, 'g.')
plot(Ch2Vin23-Ch1Vdm23, Ch2I123, 'b.')

% I1 - I2
plot(Ch2Vin21-Ch1Vdm21, Ch2I111-Ch2I121, 'r.')
plot(Ch2Vin22-Ch1Vdm22, Ch2I112-Ch2I122, 'g.')
plot(Ch2Vin23-Ch1Vdm23, Ch2I113-Ch2I123, 'b.')


% I1 + I2
plot(Ch2Vin21-Ch1Vdm21, Ch2I111+Ch2I121, 'r.')
plot(Ch2Vin22-Ch1Vdm22, Ch2I112+Ch2I122, 'g.')
plot(Ch2Vin23-Ch1Vdm23, Ch2I113+Ch2I123, 'b.')

title("TODO")
legend("4.5V", '3.5V', '2.5V')