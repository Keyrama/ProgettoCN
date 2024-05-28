% Imposta il seed per la generazione casuale dei numeri
rng(0)

% Genera i dati
xi = linspace(0, 2*pi, 101);
yi = sin(xi) + rand(size(xi)) * 0.05;

% Calcola i coefficienti del polinomio di grado 3
p = polyfit(xi, yi, 3);

% Valuta il polinomio sui punti di xi
yi_fit = polyval(p, xi);

% Grafico dei risultati
figure;
plot(xi, yi, 'o', 'DisplayName', 'Dati originali');
hold on;
plot(xi, yi_fit, '-', 'DisplayName', 'Polinomio di grado 3'); 
legend('Location', 'Best');
xlabel('xi');
ylabel('yi');
title('Approssimazione ai minimi quadrati con polinomio di grado 3');
grid on;
