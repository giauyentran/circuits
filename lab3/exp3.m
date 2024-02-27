clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("data/Lab3exp3.mat")

%% Experiment 3

% Make a plot showing the emitter-follower’s voltage transfer 
% characteristic (VTC), which is a plot of Vout as a function of Vin, 
% along with a theoretical fit. What is the incremental voltage gain of 
% the emitter follower?
figure(1)