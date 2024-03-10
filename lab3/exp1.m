clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("data/Lab3exp1.mat")

%% Experiment 1
figure(1)
% collector current and base current as a function of base voltage along 
% with appropriate theoretical fits and extracted parameter values
Ic = -Ch2Exp1Current(1:134) - Ch1Exp1Current(1:134);
Ib = Ch1Exp1Current(1:134);
V = Vexp1Ch1(1:134);

semilogy(Vexp1Ch1(1:134), Ic(1:134), '.')
hold on
semilogy(Vexp1Ch1(1:134), Ch1Exp1Current(1:134), '.')

fit1 = fit(transpose(V), transpose(Ic), 'exp1');
fit_param_cv = coeffvalues(fit1);
Is_cv = fit_param_cv(1);
Ut_cv = 1/fit_param_cv(2);

fit2 = fit(transpose(V), transpose(Ib), 'exp1');
fit2_param_cv = coeffvalues(fit2);
Is_cv2 = fit2_param_cv(1);
Ut_cv2 = 1/fit2_param_cv(2);

plot(fit1)
plot(fit2)

title("Collector and Base Current of Bipolar Transistor")
xlabel("Voltage (V)")
ylabel("Current (A)")
legend("Base Current", "Collector Current", Location='northwest')

%% 
figure(2)
% Plot the current gain, β, which is defined as the ratio of the collector
% current to the base current, as a function of the base current (you 
% should make the base-current-axis logaritmic for this plot)
current_gain = Ic./Ib;
semilogx(Ib, current_gain, 'b.')
hold on
semilogx(Ib, rb.*gm, '-')

title('TODO: Current Gain vs Base Current')
xlabel('Base Current (A)')
ylabel('Current Gain')

%% 
figure (3)
% make a log-log plot of rb versus Ib along with an appropriate 
% theoretical fit
% rb = Ut/Ib

rb = Ut_cv./Ib;
loglog(Ib(2:134), diff(V)./diff(Ib), '.')
hold on
loglog(Ib, Ut_cv./Ib, '-')

title('Incremental Resistance of Bipolar Transistor')
xlabel('Base Current (A)')
ylabel('Incremental Resistance (A)')
legend('Experimental Data', 'Theoretical Fit')

%% 
figure(4)
% Make a log-log plot of gm versus Ic along with an appropriate 
% theoretical fit.
%gm = Ic/Ut

gm = Ic./Ut_cv;
loglog(Ic(2:134), diff(Ic)./diff(V), '.')
hold on
loglog(Ic, gm, '-')

title('Incremental Resistance Gain of Bipolar Transistor')
xlabel('Collector Current (A)')
ylabel('Incremental Resistance Gain (\Omega)')
legend('Experimental Data', 'Theoretical Fit', Location='northwest')



