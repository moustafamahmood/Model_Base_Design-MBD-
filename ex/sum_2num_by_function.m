num1 = input('Enter the first number: ');
num2 = input('Enter the second number: ');

% Call the function and store the result
sumResult = MySumFunction(num1, num2);

% Display the result
disp(['The sum of ', num2str(num1), ' and ', num2str(num2), ' is: ', num2str(sumResult)]);