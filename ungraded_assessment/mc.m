% Monte Carlo experiment for random walk
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 20;

% radius = length of one step.
radius = 1;
% Define Monte Carlo parameters
numExperiments = 300;
maxSteps = 1000;
% Initialize data.
x = zeros(maxSteps, numExperiments);
y = zeros(maxSteps, numExperiments);

% Since there is only 1 row it should only
%record the fist time it crosses the boundary
out_of_bounds=zeros(1, numExperiments);

dist=zeros(maxSteps, numExperiments);
B = 10; % Boundary is 10 = max allowed distance before we go to next particle

for experiment = 1 : numExperiments
	for stepNumber = 2: maxSteps
		angle = 360 * rand; % random angle in [0,360]
		
		% Find the location of the next point
		x(stepNumber, experiment) = x(stepNumber-1, experiment) + radius * cosd(angle);
		y(stepNumber, experiment) = y(stepNumber-1, experiment) + radius * sind(angle);

		% Find distance from origin (0,0)
		dist(stepNumber, experiment)=sqrt(x(stepNumber, experiment).^2 + y(stepNumber, experiment).^2);
		
		if dist(stepNumber, experiment) >= B
			% Then the particle is greater than the distance of 10
			% Record the number of steps 
			% it took to get out of bounds.
			out_of_bounds(experiment) = stepNumber;
			% All other points will be whatever this distance is.
			dist(stepNumber+1:end, experiment) = dist(stepNumber, experiment);
			break; % Quit tracking this particle.
		end	
	end
end
maxNumberOfSteps = max(out_of_bounds);

% Plot the number of steps to get out of bounds.
subplot(1,2,1);
plot(out_of_bounds, 'b-', 'LineWidth', 2);
xlim([0, numExperiments]);
caption = sprintf('Steps until out of bounds for %d experiments', numExperiments);
title(caption, 'FontSize', fontSize);
xlabel('Experiment Number', 'FontSize', fontSize);
ylabel('Number of Steps Until Out of Bounds', 'FontSize', fontSize);
grid on;
subplot(1,2,2);
histogram(out_of_bounds);
grid on;
caption = sprintf('Distribution of the Number of Steps until out of bounds');
title(caption, 'FontSize', fontSize);

% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 

% Plot the distances as a function of step number.
figure
plot(dist, 'LineWidth', 2);
xlim([0, maxNumberOfSteps]);
grid on;
caption = sprintf('Distance vs. Step Number for %d experiments', numExperiments);
title(caption, 'FontSize', fontSize);
xlabel('Step Number', 'FontSize', fontSize);
ylabel('Distance', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 
