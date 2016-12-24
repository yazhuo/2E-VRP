function[] = figureRoute(coord_depot,coord_sat,coord_cus,best_route1,best_route2,demand)plot(coord_cus(:,1),coord_cus(:,2),'ko','MarkerSize',5, 'MarkerFaceColor','g');hold on;plot(coord_sat(:,1),coord_sat(:,2),'rs','MarkerSize',15);hold on;plot(coord_depot(1),coord_depot(2),'rp','MarkerSize',15,'MarkerFaceColor','r');hold on;for i = 1:size(coord_cus,1)    text(coord_cus(i,1),coord_cus(i,2),num2str(i),'fontsize',20);endX1 = [coord_depot(:,1)];Y1 = [coord_depot(:,2)];for i = 2:size(best_route1,2)    index1 = best_route1(1,i);    if index1 ~= 0        X1 = [X1;coord_sat(index1,1)];        Y1 = [Y1;coord_sat(index1,2)];    else        X1 = [X1;coord_depot(:,1)];        Y1 = [Y1;coord_depot(:,2)];    end    plot(X1,Y1,'k-');endfor i = 1:size(best_route2,1)    X2 = [coord_sat(i,1)];    Y2 = [coord_sat(i,2)];    route = best_route2{i,1};    for j = 2:size(route,2)        index2 = route(1,j);        if index2 ~= 0            X2 = [X2;coord_cus(index2,1)];            Y2 = [Y2;coord_cus(index2,2)];        else            X2 = [X2;coord_sat(i,1)];            Y2 = [Y2;coord_sat(i,2)];        end        plot(X2,Y2,'k-');                    end    %disp(X2);    %disp('\n');    %disp(Y2);    %disp('\n');endend