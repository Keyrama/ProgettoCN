function [gradient, Jacobian] = fun(x)
N = 50;

if N ~= length(x)
    error("Dimensione di x errata");
end

alfa = 2;
beta = -1.1;
e = ones(N, 1);
Q = zeros(N) + diag(ones(1, N)*4) + diag(ones(1, N-1), 1) + diag(ones(1, N-1), -1);

grad = @(x) Q * x - alfa * e .* sin(alfa * x) - beta * e .* exp(-x);
jacob = @(x) Q - alfa^2 * diag(e .* cos(alfa * x)) + beta * diag(e .* exp(-x));
    
gradient = grad(x);
Jacobian = jacob(x);
return;
end