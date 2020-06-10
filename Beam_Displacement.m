%% ===== Vibration and Acoustics Laboratory - UFSC =====
%
%   Thiago Morhy Cavalcante
%    Student in Mechanic Engineer Master course
%     ESI Project
%
%=======================================================

%% Longitudinal Waves

close all
clear
clc

% Frequency

f = 1; % Hertz

% Geometry

L = 10;

% Material Properties

E = 2.1e11; % Young's Modulus
rho = 7800; % Density

% Wavenumber

n = 5;
c = (E/rho)^0.5;
% kx = (n+1/2)*pi/L;
kx = n*pi/L;
omega = kx*c/500; % Radians per Second

% Axys

x = linspace(0,L,50);
t = linspace(0,2,250);

% Processing

nx = length(x);
nt = length(t);
sx0 = x;
sx0(end-round(nx/2-1):end) = L-x(end-round(nx/2-1):end);
sx0 = sx0+12;

sx = zeros(nt,nx);
for j = 1:nt
    
    sx(j,:) = sin(kx*x).*sx0*cos(omega*t(j));
    
end

%% Plot

figure
for j = 1:nt
    plot(x+sx(j,:)/L,zeros(1,nx),'o','Markersize',3)
    grid on
    xlim([x(1), x(end)]);
    ylim([-max(sx0), max(sx0)]);
    drawnow
    
end
