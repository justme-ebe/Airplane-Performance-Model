clc; close all; clear all;

% --- Inputs ---
alt_ft = 10000;         
Pa_sl = 700;            % 2 motors @ 350W
m = 1.9; W = m * 9.81;
S = 0.18; CD0 = 0.1989; e = 0.8829; AR = 5.56;

% --- Atmosphere ---
alt_m = alt_ft * 0.3048;
rho0 = 1.225;
% Simple ISA Density approximation
if alt_m < 11000
    rho = 1.225 * (1 - 0.0065 * alt_m / 288.15)^5.256;
else
    rho = 0.3639 * exp(-0.000157 * (alt_m - 11000));
end
sigma = rho / rho0;

% --- The Physics of the Shift ---
v = 1:0.5:25; 

% 1. Power Required at Altitude 
% Note: rho is in the denominator for induced power, causing it to spike.
Preq = (0.5 * rho .* v.^3 * S * CD0) + (2 * W^2) ./ (rho * S .* v * pi * e * AR);

% 2. Power Available at Altitude (The green line moves DOWN)
% Accounts for prop efficiency loss and motor cooling issues
eta_alt = 0.75 * (sigma^0.15); 
Pa_alt = Pa_sl * (sigma^1.1) * eta_alt; 

% --- ROC ---
roc_ftmin = ((Pa_alt - Preq) ./ W) * 196.85;

% --- Plotting ---
set(0,'DefaultAxesColor','k','DefaultAxesXColor','w','DefaultAxesYColor','w');
figure('Color','k');

subplot(2,1,1);
plot(v, ones(size(v))*Pa_alt, 'g', 'LineWidth', 2); hold on;
plot(v, Preq, 'r', 'LineWidth', 2);
grid on; set(gca,'GridColor',[0.3 0.3 0.3]);
ylabel('Power (W)'); title(['Power required vs Available at ', num2str(alt_ft), ' ft']);
legend('P_a (Decreasing)','P_{req} (Increasing)');

subplot(2,1,2);
plot(v, roc_ftmin, 'c', 'LineWidth', 2); hold on;
yline(0, 'r--');
grid on; set(gca,'GridColor',[0.3 0.3 0.3]);
ylabel('ROC (ft/min)'); xlabel('Velocity (m/s)');