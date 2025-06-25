Vector_Nums = input('Enter a vector of numbers \n');
squareFunc = @(x) x.^2;
squaredResult = applyfunction(squareFunc, Vector_Nums);
disp(['Squared: ', num2str(squaredResult)]);
cubeFunc = @(x) x.^3;
cubedResult = applyfunction(cubeFunc, Vector_Nums);
disp(['Cubed: ', num2str(cubedResult)]);