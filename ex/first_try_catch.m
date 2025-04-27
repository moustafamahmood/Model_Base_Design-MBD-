try
    file_ID= fopen ('textfile.txt','r');
    data = fscan(file_ID,'%d');
    fclose(file_ID);
    disp('NO ERROR\n');
catch
    disp('ERROR: uniple to read this file');
end
