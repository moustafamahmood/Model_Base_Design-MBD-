x = 0:0.1:2*pi;      
y = sin(x);        
plot(x, y, 'r', 'LineWidth', 2);
xlabel('x values (radians)'); 
ylabel('sin(x)');             
title('Sine Wave');            
legend('sin(x)');             
grid on;                
