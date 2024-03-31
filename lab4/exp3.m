clear; clf;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load Lab4exp3.mat

% In your report, include a semilog plot showing all three output 
% current-voltage (drain) characteristics (with no fits).

semilogy(VoutCh1WI, IdCh2WI, '.')
hold on
semilogy(VoutCh1MI, IdCh2MI)
semilogy(VoutCh1SI, IdCh2SI)

% From each drain characteristic, extract values of the Early voltage, 
% the Early effect resis- tance (ro), the transistor’s on resistance (ron), 
% and its intrinsic gain (i.e., the ratio ro/ron). In your report, include 
% a table of these values for each input current level

% ro = Va/Iout
% ron = 1/gs; Ut/Isat for WI, Ut/sqrt(Isat) for SI
% ro/ron = Va/Ut SI; Va/Ut * sqrt(Is/Isat)