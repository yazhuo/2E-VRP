function[] = cvrp(CustomSet, demand, distance, K2)n = 10; %种群大小m = size(CustomSet,2);iterition = 100; %迭代次数(遗传代数）Pc = 0.9; %交叉概率Pm = 0.1; %变异概率len = zeros(n,1);%----随机父代----family = zeros(n, m);for i = 1:n    family(i,:) = CustomSet(randperm(m));enddisp(family);counter = 0;while counter < iterition     %----计算路径长度----    for i = 1:n        len(i,1) = RouteLength(family(i,:), demand, distance, m, K2);        disp(len);    end       %----选择----    %----交叉----    %----变异----    %----种群的更新endend