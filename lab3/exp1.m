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
Ic = -Ch2Exp1Current - Ch1Exp1Current;
semilogy(Vexp1Ch1(1:134), Ic(1:134), '.')
%% 
figure(2)
% Plot the current gain, β, which is defined as the ratio of the collector
% current to the base current, as a function of the base current (you 
% should make the base-current-axis log- aritmic for this plot)
%% 

figure (3)
% make a log-log plot of rb versus Ib along with an appropriate 
% theoretical fit
%% 

figure(4)
% Make a log-log plot of gm versus Ic along with an appropriate 
% theoretical fit.



