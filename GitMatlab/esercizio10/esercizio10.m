
A=[7,1,2,2;14,2,4,4;10,4,8,7];
b=(1:4)';
disp(A);
disp(b);
[x,nr] = miaqr(A,b);
disp("x = " + x);
disp("nr = " + nr);