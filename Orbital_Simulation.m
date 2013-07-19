tic;
%This starts the program timer.

clc;
%Clears the command window.

clear;
%Clears the variable workspace memory. 

gp = 3.986e14;
%Gravitational parameter of the Earth (G * m). 

to = [0, 7500];
%Simulation time.

rp = 6678136;
%Periapsis.

e = 0;
%Orbital eccentricity.

a = rp / (1 - e);
%Semimajor axis.

p = a * (1 - e^2);
%Semiparameter.

Ro = [rp; 0; 0];
%Initial position. 

Vo = sqrt(gp / p) * [0; 1 + e; 0];
%Initial velocity.

So = [Ro; Vo];
%Initial state.

options = odeset('RelTol',1e-10);
%Adjusts the accuracy of the numerical integrator.

[t,S] = ode45(@Orbital_Model,to,So,options);
%Solves the two-body problem.

S = transpose(S) / 6378136;
%Converts all the data from meters to Earth radii.

screen_size = get(0,'ScreenSize');
%Determines the location and dimensions of the current monitor.
Archive.Window = figure( ...
    'NumberTitle','Off', ...
    'Name','Orbital Simulation', ...
    'OuterPosition',screen_size);
%Opens a new plotting window and adjusts its properties.

Archive.Axes = axes( ...
    'Parent',Archive.Window, ...
    'PlotBoxAspectRatio',[1,1,1], ...
    'XLim',[-2,2], ...
    'YLim',[-2,2]);
%Adds an axes to the current window and adjusts its properties.

Archive.Plot = plot(S(:,1),S(:,2), ...
    'Color','k', ...
    'Parent',Archive.Axes);
%Adds a plot to the current window and adjusts its properties.

simulation_time = toc;
%This stops the program timer.

fprintf('Simulation Time: %0.8f\n',simulation_time);
%Prints the simulation time on the command window. 