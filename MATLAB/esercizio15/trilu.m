function x = trilu(A,b)
%   function che risolve il sistema Ax=b con fattorizzazione LU senza
%   pivoting parziale
%
%   x = trilu(A,b)
%   
%  Input:
%       A - matrice dei coefficienti
%       b - vettore termini noti
%
%  Output:
%       x - soluzione sistema Ax=b
%

[m,n] = size(A);

if m ~= n
    error("matrice non quadrata");
end

if n~=length(b)
    error("b non compatibile con A");
end

if size(b,2)>1
    error("b non è un vettore colonna");
end

for i=1:n-1

    if A(i,i)==0
        error('matrice singolare');
    end
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);

end

x=b;

%triang inferiore
for i=1:n
    x(i+1:n) = x(i+1:n)-A(i+1:n,i)*x(i);
end

%triang superiore
for i=n:-1:1
    x(i) = x(i)/A(i,i);
    x(1:i-1) = x(1:i-1)-A(1:i-1,i)*x(i);
end

end