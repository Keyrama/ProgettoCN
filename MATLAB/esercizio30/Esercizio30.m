fun = @(x) (exp(3*x));

[If, err] = composita(fun, 0, 1, 1, 12);
disp("valore: " + If + "   err: " + err);
[If, err] = composita(fun, 0, 1, 2, 12);
disp("valore: " + If + "   err: " + err);
[If, err] = composita(fun, 0, 1, 3, 12);
disp("valore: " + If + "   err: " + err);
[If, err] = composita(fun, 0, 1, 6, 12);
disp("valore: " + If + "   err: " + err);