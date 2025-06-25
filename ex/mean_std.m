Vector_Num = input('Enter a vector of numbers \n');
[meanResult,stdResult] = computeStatistics_mean_std(Vector_Num);
disp(['Mean: ', num2str(meanResult)]);
disp(['Standard Devi2ation: ', num2str(stdResult)]);