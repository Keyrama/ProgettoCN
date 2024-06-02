function [x,i]=secanti(fun,x0,x1,tol,itmax)

%
%   function [x,i]=secanti(fun,x0,x1,tol,itmax)
%   approssima lo zero della funzione attraverso il metodo delle secanti
%   Input:
%           fun - identificatore della function della funzione
%         x0,x1 - punti iniziali
%           tol - tolleranza
%         itmax - numero massimo di iterazioni
%   Output:
%           x - approssimazione dello zero della funzione
%           i - numero iterazioni necessarie
f0 = feval(fun,x0);
f1 = feval(fun,x1);
err = abs(x1-x0)/(1+abs(x1));

for i=1:itmax
    den = (f1-f0)/(x1-x0);
    x = x1-f1/den;
    err = abs(x-x1)/(1+abs(x1));

    if err <= tol
        return
    end

    x0 = x1;
    f0 = f1;
    x1 = x;
    f1 = feval(fun,x1);
end

if i >= itmax && err>tol
    warning("numero iterazioni completate, ma tolleranza non raggiunta");
end
return