% Define parameters
radius = 1; % Radius of the circle
theta = linspace(0, 360, 100); % Angle values from 0 to 360 degrees

% Calculate X and Y coordinates
x = radius * cosd(theta);
y = radius * sind(theta);

% Create a table for writing to Excel
data = table(theta', x', y', 'VariableNames', {'Theta', 'X', 'Y'});

% Write to Excel file
writetable(data, 'circle_coordinates.xlsx');
