N = 50;

tols = [1e-3, 1e-8, 1e-13];
nit_res = zeros(length(tols), 1);
sols = zeros(N, length(tols));

for i = 1:length(tols)
    tol = tols(i);
    [x, nit] = newton(@fun, zeros(N, 1), tol, 1000000);
    sols(:, i) = x;
    nit_res(i) = nit;
end

pointer = ['x', 'o', '+'];
for i = 1:length(tols)
    disp(nit_res(i));
    plot(1:N, sols(:, i), pointer(i), "DisplayName", num2str(tols(i)));
    hold on
end

hold off
xlabel('Indice');
ylabel('Valore');
title('Soluzioni per le tolleranze date');
legend('Location', 'Best');
grid on;