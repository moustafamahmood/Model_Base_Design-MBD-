color_code = input('Enter a color code ("R", "G", "B", "Y", "O"): ', 's');

switch color_code
    case 'R'
        color_name = 'Red';
    case 'G'
        color_name = 'Green';
    case 'B'
        color_name = 'Blue';
    case 'Y'
        color_name = 'Yellow';
    case 'O'
        color_name = 'Orange';
    otherwise
        color_name = 'Invalid color code. Please enter R, G, B, Y, or O.';
end
disp(['The color code ' color_code ' corresponds to: ' color_name]);