% Imposta il seed per la generazione casuale dei numeri
rng(0);

% Genera i dati
xi = linspace(0, 2*pi, 101);
yi = sin(xi) + rand(size(xi)) * 0.05;

% Costruisci manualmente la matrice di Vandermonde per il polinomio di grado 3
n = length(xi);
V = zeros(n, 4);
for i = 1:n
    V(i, :) = [xi(i)^3, xi(i)^2, xi(i), 1];
end

% Risolvi il sistema lineare V * a = yi per ottenere i coefficienti
a = V \ yi';

% I coefficienti sono già nell'ordine giusto per l'uso con polyval
p = a;

% Valuta il polinomio sui punti di xi
yi_fit = polyval(p, xi);

% Grafica dei risultati
figure;
plot(xi, yi, 'o', 'DisplayName', 'Dati originali'); % Dati originali
hold on;
plot(xi, yi_fit, '-', 'DisplayName', 'Polinomio di grado 3'); % Polinomio approssimante
legend show;
xlabel('xi');
ylabel('yi');
title('Approssimazione ai minimi quadrati con polinomio di grado 3');
grid on;
