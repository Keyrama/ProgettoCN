fun = @(x) (exp(3*x));
primitiva = @(x) (exp(3*x)/3);
true_val = primitiva(1)-primitiva(0);

[If, err] = composita(fun, 0, 1, 1, 12);
true_err = true_val-If;
disp("valore: " + If + "   err: " + err + "   true error: " + true_err);

[If, err] = composita(fun, 0, 1, 2, 12);
true_err = true_val-If;
disp("valore: " + If + "   err: " + err + "   true error: " + true_err);

[If, err] = composita(fun, 0, 1, 3, 12);
true_err = true_val-If;
disp("valore: " + If + "   err: " + err + "   true error: " + true_err);

[If, err] = composita(fun, 0, 1, 6, 12);
true_err = true_val-If;
disp("valore: " + If + "   err: " + err + "   true error: " + true_err);