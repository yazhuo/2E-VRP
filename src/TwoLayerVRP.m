function [layer1,layer2,totalcost,best_route1_with_zero,best_route2] = TwoLayerVRP(coord_dep,coord_sat,coord_cus,fleet,demand)    % custom_num 客户的个数% sat_num 卫星的个数% m1 第一层车辆数量% m2 第二城车辆数量% K1 第一层车辆的容量% K2 第二层车辆的容量custom_num = size(coord_cus,1);sat_num = size(coord_sat,1);disp(sat_num);m1 = fleet(1,2);K1 = fleet(1,1);m2 = fleet(2,2);K2 = fleet(2,1);len = 0;%-------------------------------------------------------% 1. First Clustering% 将每个客户分配给一个卫星%-------------------------------------------------------DepotSatDist = calDepotSatDist(coord_dep, coord_sat, sat_num);SatCusDist = calSatCusDist(coord_sat, coord_cus, sat_num, custom_num);SatSatDist = calSatSatDist(coord_sat, sat_num);Cus2CusDist = calCus2CusDist(coord_cus, custom_num);assign_table = assignCus2Sat(SatCusDist, sat_num, custom_num, demand, K2, m2);%-------------------------------------------------------% 2. GACVRP% 使用遗传算法解决Ns+1个CVRP问题%-------------------------------------------------------CustomSet = zeros(1,0);sat_demand = zeros(sat_num,1);SatSet = zeros(1, sat_num);layer2 = cell(sat_num,1);totalcost = 0;best_route2 = cell(sat_num,1);%----第二层----for i = 1:sat_num    %整合卫星-客户距离    temp1 = [0 SatCusDist(i,:)];    temp2 = [SatCusDist(i,:)' Cus2CusDist];    distance2 = [temp1;temp2];    %划分卫星客户群    for j = 1:custom_num        if assign_table(i,j) == 1            CustomSet = [CustomSet j];        end    end        %计算每个卫星的货物量    for k = 1:size(CustomSet,2)        sat_demand(i,1) = sat_demand(i,1) + demand(CustomSet(1,k),1);    end           [best_length2,best_route2_with_zero] = cvrp(CustomSet, demand, distance2, K2);    best_route2{i,1} = best_route2_with_zero;    CustomSet = zeros(1,0);    SatSet(1,i) = i;      output2 = calOutput(best_route2_with_zero,distance2,demand);    layer2{i,1} = output2;    totalcost = totalcost + best_length2;    end%----第一层----%整合卫星-仓库距离temp1 = [0 DepotSatDist'];temp2 = [DepotSatDist SatSatDist];distance1 = [temp1; temp2];[best_length1, best_route1_with_zero] = cvrp(SatSet, sat_demand, distance1, K1);layer1 = calOutput(best_route1_with_zero,distance1,sat_demand);totalcost = totalcost + best_length1;  end