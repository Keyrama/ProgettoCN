x = linspace(1, 5/3, 100001);
f = @(x) 1 + x.^2 + (log(abs( 3*(1 - x) + 1)))/80;
xmin = fminbnd(f,1,5/3);
disp(['Il minimo della funzione è in x = ', num2str(xmin)]);
disp(['Il valore minimo della funzione è f(x) = ', num2str(f(xmin))]);
plot(x,f(x));


