mode= input('Enter transportation that you will use :\n','s');
switch mode 
    case 'car'
        disp('your cost will be around 2K$');
    case 'train'
        disp('your cost will be around 3K$');
    case 'bus'
         disp('your cost will be around 4K$');
    case 'airplane'
          disp('your cost will be around 5K$');
           otherwise
        disp('Invalid mode of transportation. Please enter car, train, bus, or airplane.');
end




