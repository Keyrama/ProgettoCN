rng(0);
%A=randi([1,10],3,3);

A=[1,2,3;2,4,6;7,8,9];
b=(1:3)';
disp(A);
disp(b);
disp(mialdl(A,b));