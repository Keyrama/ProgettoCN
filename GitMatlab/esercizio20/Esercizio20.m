fun = @(x) (exp(x/2 + exp(-x)));
funPrime = @(x) (.5*exp(exp(-x) - x/2).*(-2 + exp(x)));

xi = [0 2.5 5];
fi = fun(xi);
f1i = funPrime(xi);

x = linspace(0, 5, 1000);

yHermite = hermite(xi, fi, f1i, x);
yTrue = fun(x);

% Grafico della funzione
figure;
plot(xi,fi,'bo','DisplayName', 'punti di interpolazione');
hold on

plot(x, yTrue, 'DisplayName', 'funzione');
hold on

plot(x, yHermite,'DisplayName', 'hermite');
hold on

legend('Location', 'Best');
grid on;
xlabel('x');
ylabel('f(x)');
title('Approssimazione con polinomio interpolante di Hermite');
hold off

dfTrue = funPrime(x);

% Calcolo dei vettori raddoppiati
xiRaddoppiato = repelem(xi, 2);
fi = repelem(fi, 2);
for i = 1:length(f1i)
    fi(i*2) = f1i(i);
end
dd = ddHermite(xi, fi);

% Grafico della derivata
figure;
plot(xi,f1i,'bo','DisplayName', 'derivata nei punti di interpolazione');
hold on

plot(x, hornerDerivata(x, dd, xiRaddoppiato), 'DisplayName', 'derivata');
hold on

plot(x, dfTrue, 'DisplayName', 'hermiteDerivata');

xlabel('x');
ylabel("f '(x)");
title('Approssimazione della derivata con polinomio interpolante di Hermite');
legend('Location', 'Best');
grid on;
hold off
