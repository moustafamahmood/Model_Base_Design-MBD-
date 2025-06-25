myCellArray = {'moustafa', 24, 186.5, true, 'mechatronics',[1,2,3]};
i= input('Enter an index (1 to 6) to access the cell array: ');


if i>= 1 && i <= length(myCellArray)
  
    disp('The element at the specified index is:');
    disp(myCellArray{i});
else
    disp('Invalid index. Please enter a number between 1 and 6.');
end