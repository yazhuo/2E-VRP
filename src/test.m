p = [1 2 3 4 5 6 7 8];demand = [2 4 1 5 6 8 1 2];m = 8;K2 = 7;individual =[0];capacity_used = 0;%b = 2;%----插入0表示卫星点----for i = 1:m    if (capacity_used + demand(1,p(1,i)) <= K2)        %individual(1,b) = p(1,i);        individual= [individual p(1,i)];        capacity_used = capacity_used + demand(1,p(1,i));        %b = b + 1;    else        %individual(1,b) = 0;        %b = b + 1;        individual = [individual 0];        %individual(1,b) = p(1,i);        individual = [individual p(1,i)];        %b = b + 1;        capacity_used = demand(1,p(1,i));    end        endindividual = [individual 0];disp(p);disp(demand);disp(individual);len = 0;for i = 1:size(individual,2)            end