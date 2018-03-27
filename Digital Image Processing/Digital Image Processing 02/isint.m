function f = isint(a)
    if (a - ceil(a)) == 0
        f = 1;
    else
        f = 0;
    end