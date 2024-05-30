for i=1:7
    c = pesiNewtonCotes(i);
    rational = rats(c);
    disp(rational);
end

disp(rats(pesiNewtonCotes(9)));