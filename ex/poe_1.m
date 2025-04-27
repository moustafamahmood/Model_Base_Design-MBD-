% Script to calculate the cost of a trip based on transportation mode
distance = input('Enter the distance of the trip in miles: ');
mode = input('Enter the mode of transportation (car, train, bus, airplane): ', 's');

% Initialize cost per mile
cost_per_mile = 0;

switch lower(mode)
    case 'car'
        cost_per_mile = 0.50; % Cost per mile for car
    case 'train'
        cost_per_mile = 0.30; % Cost per mile for train
    case 'bus'
        cost_per_mile = 0.20; % Cost per mile for bus
    case 'airplane'
        cost_per_mile = 0.75; % Cost per mile for airplane
    otherwise
        disp('Invalid mode of transportation. Please enter car, train, bus, or airplane.');
        return; % Exit the script if invalid input
end

% Calculate total cost
total_cost = cost_per_mile * distance;

% Display the result
fprintf('The total cost of the trip by %s for %d miles is $%.2f.\n', mode, distance, total_cost);