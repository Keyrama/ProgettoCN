nn = (1:100);
llChebyshev = lebesgue(0, 1, nn, 1);
llEquidistanti = lebesgue(0, 1, nn, 0);

semilogy(nn, llChebyshev, 'DisplayName', 'chebyschev');
hold on
semilogy(nn, llEquidistanti,'DisplayName', 'equidistanti');
legend('Location', 'Best');
hold off
xlabel('grado del polinomio');
ylabel('LL');
title('Approssimazione costante di Lebesgue');

