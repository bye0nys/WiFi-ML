clear all; clc
ploting= importdata('D:\변윤석\4학년\캡스톤디자인\20.06.11 재실험\실험\6.6.csv');

numbering = 6;  % 경로 숫자 적기 

Point_No = 11; % 경로 7,8 = 13 
X1 = ploting(1, :);
Y1 = ploting(2, :);

Step_Count = Point_No - 1;
Xlength = floor(length(X1) / Point_No);
Xrem = rem(length(X1),Point_No); % 나머지  

X10_ = X1(1:length(X1)-Xrem) %point마다 n개씩 나누게 나머지 없애기
Y11_ = Y1(1:length(Y1)-Xrem)

X_Vec = reshape(X10_, [Xlength, Point_No])'; % 포인트마다 n등분 
Y_Vec = reshape(Y11_, [Xlength, Point_No])';

for i = 1 : 1 : length(X1) - 1
    R1(i) = sqrt((X1(i+1) - X1(i)).^2 + (Y1(i+1)-Y1(i)).^2);
end
R_sum = sum(R1);
Step_Length = R_sum / (length(X1)-1);

% 2번 Origin Point 
for i = 1 : 1 : length(X1)
    plot(X1(i), Y1(i), '.'); hold on;
end

% ********* 실제 좌표 수정 구간임 !!!! ***********
if numbering == 1 || numbering == 2 || numbering == 3
    seta_1 = atand(1);
    Length_1 = sqrt((5.5 - 1)^2+(5.5 - 1)^2);
    Length1 = Length_1 / Step_Count;
elseif numbering == 4 || numbering == 5 || numbering == 6
    seta_1 = atand(-1);
    Length_1 = sqrt((5.5 - 1)^2+(5.5 - 1)^2);
    Length1 = Length_1 / Step_Count;    
elseif numbering == 7
    seta_1 = atand(5/3);
    Length_1 = sqrt((5.5 - 1)^2 + (8.5 - 1)^2);
    Length1 = Length_1 / Step_Count;
elseif numbering == 8
    seta_1 = atand(-5/3);
    Length_1 = sqrt((5.5 - 1)^2 + (8.5 - 1)^2);
    Length1 = Length_1 / Step_Count;
end

 cosine2 = Length1 * cosd(seta_1); sine2 = Length1 * sind(seta_1);
 Cosine2 = ones(1, Point_No); Sine2 = ones(1, Point_No); Cosine2 = Cosine2 .* cosine2; Sine2 = Sine2 .* sine2;
 y_b = [0, 1.5, 3, 4.5, 6, 7.5, 0, 7.5]; % 경로에 맞춰 y 절편을 더해줘야 합니다 : 0 1.5 3 6.5 8 9.5 -2/3 61/6
 
     for i = 1 : 1 : Point_No
         Origin_PointX(i) = 1 + Cosine2(i) .* (i-1);
         Origin_PointY(i) = 1 + Sine2(i) .* (i-1) + y_b(numbering);
    end

plot(Origin_PointX, Origin_PointY, 'b'); hold on; 
p1 = plot(Origin_PointX, Origin_PointY, '.r', 'MarkerSize', 25); hold on;

xlim([-5 15]);
ylim([-5 15]);

% ********* 리니어 레그레이션 구간임 !!!! ***********
mdl = fitlm(X1,Y1);
mdl_X = table2array(mdl.Coefficients(2, 1)); mdl_Y = table2array(mdl.Coefficients(1, 1));
seta2 = atand(mdl_X); cosine = Step_Length * cosd(seta2); sine = Step_Length * sind(seta2);
figure(1);
reference_x = 0:1:10;
reference_y = mdl_X * reference_x + mdl_Y;
plot(reference_x,reference_y, 'r');
hold on;

% ********* 초기값(최적값) 찾는 풀서치 구간임 !!!! ***********
X_axis = 0 : 0.1 : 4;
Y_axis = mdl_X * X_axis + mdl_Y; repeat = length(X_axis); Distance = zeros(1, repeat); 
Cosine = ones(1, repeat); Sine = ones(1, repeat); Cosine = Cosine .* cosine; Sine = Sine .* sine;

for i = 1 : 1 : Point_No
    Cosine_R(i) = Cosine(i) .* (i-1);
    Sine_R(i) = Sine(i) .* (i-1);
end
PointX = X_axis' + Cosine_R; PointY = Y_axis' + Sine_R;

% 첫번째 알고리즘 (최소)
% for i = 1 : 1 : repeat
%     for j = 1 : 1 : Point_No
%      Distance_mins(:, j) = [sqrt((X1-PointX(i, j)).^2 + (Y1-PointY(i, j)).^2)'];
%      Distance_minn = min(Distance_mins,[],2);
%      Distance_final(i) = sum(Distance_minn) / (length(X1) - 1);
%     end
% end
% Distance_min = min(Distance_final); Distance_min_Point = find(Distance_min == Distance_final);


%두번째 알고리즘 (n등분) 
for i= 1 : 1 : repeat 
   for j=1:1:Point_No 
    Distance_(i,j) = (sqrt((X_Vec(j,1)-PointX(i,j)).^2+(Y_Vec(j,1)-PointY(i,j)).^2)+sqrt((X_Vec(j,2)-PointX(i,j)).^2+(Y_Vec(j,2)-PointY(i,j)).^2)+sqrt((X_Vec(j,3)-PointX(i,j)).^2+(Y_Vec(j,3)-PointY(i,j)).^2)+sqrt((X_Vec(j,4)-PointX(i,j)).^2+(Y_Vec(j,4)-PointY(i,j)).^2)+sqrt((X_Vec(j,5)-PointX(i,j)).^2+(Y_Vec(j,5)-PointY(i,j)).^2)+sqrt((X_Vec(j,6)-PointX(i,j)).^2+(Y_Vec(j,6)-PointY(i,j)).^2)+sqrt((X_Vec(j,7)-PointX(i,j)).^2+(Y_Vec(j,7)-PointY(i,j)).^2)+sqrt((X_Vec(j,8)-PointX(i,j)).^2+(Y_Vec(j,8)-PointY(i,j)).^2)+sqrt((X_Vec(j,9)-PointX(i,j)).^2+(Y_Vec(j,9)-PointY(i,j)).^2)+sqrt((X_Vec(j,10)-PointX(i,j)).^2+(Y_Vec(j,10)-PointY(i,j)).^2)+sqrt((X_Vec(j,11)-PointX(i,j)).^2+(Y_Vec(j,11)-PointY(i,j)).^2))/Point_No;
end
end
Distance= mean(Distance_,2);
Distance_min = min(Distance); Distance_min_Point = find(Distance == Distance_min);


% ********* 각종 오차거리 구하는 구간임 !!!! ***********
% 실제 좌표 - 최적 좌표
Optimal_X = PointX(Distance_min_Point, :); Optimal_Y = PointY(Distance_min_Point, :);
for i = 1 : 1 : Point_No
    Distance_Op_Ox_Vector(i) = sqrt((Origin_PointX(i) - Optimal_X(i)).^2 + (Origin_PointY(i) - Optimal_Y(i)).^2);
end
Distance_Op_Ox = mean(Distance_Op_Ox_Vector)


% 측정 좌표 - 실제 좌표

% 첫번째 알고리즘(최소) 
% for i = 1 : 1 : 1
%     for j = 1 : 1 : Point_No
%      Distance_mins_origin(:, j) = [sqrt((X1-Origin_PointX(1, j)).^2 + (Y1-Origin_PointY(1, j)).^2)'];
%      Distance_minn_origin = min(Distance_mins_origin,[],2);
%      Distance_final_origin(i) = sum(Distance_minn_origin) / (length(X1) - 1);
%     end
% end
% 

% 두번째 알고리즘(n등분) 

for j=1:1:Point_No %1~11
    Distance_origin(1,j) = (sqrt((X_Vec(j,1)-Origin_PointX(1,j)).^2+(Y_Vec(j,1)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,2)-Origin_PointX(1,j)).^2+(Y_Vec(j,2)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,3)-Origin_PointX(1,j)).^2+(Y_Vec(j,3)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,4)-Origin_PointX(1,j)).^2+(Y_Vec(j,4)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,5)-Origin_PointX(1,j)).^2+(Y_Vec(j,5)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,6)-Origin_PointX(1,j)).^2+(Y_Vec(j,6)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,7)-Origin_PointX(1,j)).^2+(Y_Vec(j,7)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,8)-Origin_PointX(1,j)).^2+(Y_Vec(j,8)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,9)-Origin_PointX(1,j)).^2+(Y_Vec(j,9)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,10)-Origin_PointX(1,j)).^2+(Y_Vec(j,10)-Origin_PointY(1,j)).^2)+sqrt((X_Vec(j,11)-Origin_PointX(1,j)).^2+(Y_Vec(j,11)-Origin_PointY(1,j)).^2))/Point_No;   
end

Distance_Rp_Ox=mean(Distance_origin)
% for i = 1 : 1 : repeat
%     Distance_2(i) = mean(sqrt((X1 - Origin_PointX(i)).^2 + (Y1 - Origin_PointY(i)).^2);
% end
% Distance_Rp_Ox = mean((sqrt((X1-Origin_PointX(1)).^2+(Y1-Origin_PointY(1)).^2) / Step_Count)
% + sqrt((X8-Origin_PointX(2)).^2+(Y8-PointY(2)).^2) + sqrt((X15-Origin_PointX(3)).^2+(Y15-Origin_PointY(3)).^2) + sqrt((X22-Origin_PointX(4)).^2+(Y22-Origin_PointY(4)).^2)) /4)

% ********* 플로팅 구간임 !!!! ***********

p2 = plot(Optimal_X, Optimal_Y, 'p', 'MarkerEdgeColor', 'k', 'MarkerSize', 15);
% Legend 수정코드 !
lgd = legend([p1 p2], {'Origin Point', 'Estimated Point'}, 'Location','northeast', 'FontSize', 14, 'FontWeight', 'bold');
lgd = legend('boxoff');
% xlim([0 8]);
% ylim([1 10]);
hold on;

clearvars -except Distance_Op_Ox Distance_Rp_Ox Step_Length Distance_min Distance_min_Point Distance Optimal_X Optimal_Y;