% Definire la funzione di Runge
runge = @(x) 1 ./ (1 + x.^2);

% Intervallo di interpolazione
a = -10;
b = 10;

% Punti di valutazione per la stima dell'errore
x_eval = linspace(a, b, 10001);
f_eval = runge(x_eval);

% Inizializzare i vettori per h e gli errori
n_values = 4:4:800;
h_values = 20 ./ n_values;
error_natural = zeros(size(n_values));
error_not_a_knot = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    
    % Punti di interpolazione
    x_nodes = linspace(a, b, n + 1);
    f_nodes = runge(x_nodes);
    
    % Costruire le spline naturale e not-a-knot
    spline_natural = spline(x_nodes, f_nodes);
    spline_not_a_knot = csapi(x_nodes, f_nodes);
    
    % Valutare le spline sui punti di valutazione
    f_spline_natural = ppval(spline_natural, x_eval);
    f_spline_not_a_knot = fnval(spline_not_a_knot, x_eval);
    
    % Calcolare l'errore massimo
    error_natural(i) = max(abs(f_eval - f_spline_natural));
    error_not_a_knot(i) = max(abs(f_eval - f_spline_not_a_knot));
end

% Grafico in scala log-log
figure;
loglog(h_values, error_natural, '-o', 'DisplayName', 'Spline Naturale');
hold on;
loglog(h_values, error_not_a_knot, '-x', 'DisplayName', 'Spline Not-a-Knot');
hold off;
xlabel('h');
ylabel('Errore di approssimazione');
title('Errore di approssimazione con spline interpolanti');
legend('Location', 'Best');
grid on;

% Osservazione della decrescita dell'errore
