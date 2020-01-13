
es = 1;

% item a)
[x_a,ea_a,iter_a] = r_aurea(-2,4,100,es);
item_a = [x_a,ea_a,iter_a];

% item b)
[x_b,ea_b,iter_b] = inter_parab(1.75,2,2.5,es,100);
item_b = [x_b,ea_b,iter_b];

% item c)
[x_c,ea_c,iter_c] = newton_optimal(3,es,100);
item_c = [x_c,ea_c,iter_c];

answer = [item_a;item_b;item_c]