n= input('Enter positive number');
if n<0
    disp('you enter nigative number');
else
    fact = 1;
    count= 1 ;
    while count<=n
        fact = fact * count;
        count=count+1;
    end
    fprintf('the factorial of %d is %d\n ',n,fact);
end