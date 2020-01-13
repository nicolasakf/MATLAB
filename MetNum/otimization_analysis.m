
% funcao a ser otimizada
% syms x
% f = symfun(f(x),x);
% f = 3*x^3 + 10*x^2 + 6*x;

if true
    % maximo local
    es = 0.003;

    [x_a,ea_a,iter_a] = r_aurea_max(-2,1,100,es,false);
    item_a = [x_a,ea_a,iter_a];

    [x_b,ea_b,iter_b] = inter_parab_max(-2,-1,1,es,100,false);
    item_b = [x_b,ea_b,iter_b];

    [x_c,ea_c,iter_c] = newton_optimal(-1,es,100,false);
    item_c = [x_c,ea_c,iter_c];

    max = [item_a;item_b;item_c]
end

if false
    % minimo local
    es = 0.003;

    [x_a,ea_a,iter_a] = r_aurea_min(-2,1,100,es,false);
    item_a = [x_a,ea_a,iter_a];
    %item_a

    [x_b,ea_b,iter_b] = inter_parab_min(-2,-1,1,es,100,false);
    item_b = [x_b,ea_b,iter_b];
    %item_b

    [x_c,ea_c,iter_c] = newton_optimal(-1,es,100,false);
    item_c = [x_c,ea_c,iter_c];
    %item_c

    min = [item_a;item_b;item_c]
end

