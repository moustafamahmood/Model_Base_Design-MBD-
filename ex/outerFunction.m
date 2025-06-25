function outerFunction()

    function result = innerFunction(a, b)
        result = a * b;
    end

 num1 = input('Enter the first number: ');
 num2 = input('Enter the second number: ');

  sumResult = innerFunction(num1, num2);

    % Display the result
    disp(['The multplay of ', num2str(num1), ' and ', num2str(num2), ' is: ', num2str(sumResult)]);
end