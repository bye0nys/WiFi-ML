clear all;
clc

Data_X1= importdata('C:\Users\LG\Desktop\실험\R2_3_RTT.csv');
% Data_X2= importdata('제일중요함\1.2.2.csv'); % Data_X3= importdata('제일중요함\1.2.3.csv'); % Data_X4= importdata('제일중요함\1.2.4.csv');

Sample = 1; Data_Var = 1; Sample_no = Sample / Data_Var; repeat = 500; a = [6.5;0;0;6.5]; b = [9.5;9.5;0;0]; c = [1.6;1.6;1.6;1.6];  
% B1 = Data_X1(:, 3); B2 = Data_X2(:, 3); B3 = Data_X3(:, 3); B4 = Data_X4(:, 3); B1_ = B1(1:Sample); B2_ = B2(1:Sample); B3_ = B3(1:Sample); B4_ = B4(1:Sample); B1_mat = reshape(B1_, [Sample_no, Data_Var]); B2_mat = reshape(B2_, [Sample_no, Data_Var]); B3_mat = reshape(B3_, [Sample_no, Data_Var]); B4_mat = reshape(B4_, [Sample_no, Data_Var]); B1_mean = mean(B1_mat); B2_mean = mean(B2_mat); B3_mean = mean(B3_mat); B4_mean = mean(B4_mat); F1_set = zeros(1, repeat); F2_set = zeros(1, repeat); F3_set = zeros(1, repeat); F4_set = zeros(1, repeat); F1_Set = zeros(1, repeat); F2_Set = zeros(1, repeat); F3_Set = zeros(1, repeat); F4_Set = zeros(1, repeat); X1_set = zeros(1, repeat); X2_set = zeros(1, repeat); X3_set = zeros(1, repeat);
for h = 3 : 1 : length(Data_X1)
B1_mean = Data_X1(1, h); B2_mean = Data_X1(2, h); B3_mean = Data_X1(3, h); B4_mean = Data_X1(4, h); 
Initial_X = [0, 3, 5, 1, -4, -3 ; 0, 5, 4, 2, -2, -1 ; 0, 1, 5, 4, -3, -2];
% for n = 1.1 : 1 : 24.1
%     cnt = 0.1;
%     for p = 1 : 1.5 : 5.5
%         for q = 1 : 1.5 : 8.5
%             cnt = cnt + 1;
%             if Data_X1(1,1) == n
%                 if cnt == n
%                     Y=[p;q;0.88];
%                 end
%             end
%         end
%     end
% end
for n = 1.2 : 1 : 24.2
    cnt = 0.2;
     for p = 1 : 1.5 : 5.5
        for q = 1 : 1.5 : 8.5
            cnt = cnt + 1;
            if Data_X1(1,1) == n
                if cnt == n
                    Y=[p;q;1.25];
                end
            end
        end
     end
end
% for n = 1.3 : 1 : 24.3
%     cnt = 0.3;
%     for p = 1 : 1.5 : 5.5
%         for q = 1 : 1.5 : 8.5
%             cnt = cnt + 1;
%             if Data_X1(1,1) == n
%                 if cnt == n
%                     Y=[p;q;1.4];
%                 end
%             end
%         end
%     end
% end
    for i = 1 : 1 : 6
%         for o = 1 : 1 : Data_Var
        X = Initial_X(:, i);
        for n = 1 : repeat
            r = [B1_mean ; B2_mean ; B3_mean ; B4_mean];   % r 

            F1 = sqrt((X(1) - a(1)).^2 + (X(2)-b(1)).^2 + (X(3) - c(1)).^2) - r(1);
            F2 = sqrt((X(1) - a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2) - r(2);
            F3 = sqrt((X(1) - a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2) - r(3);
            F4 = sqrt((X(1) - a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2) - r(4);

            F = [F1;F2;F3;F4];

            J1 = [(X(1)-a(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2 + (X(3) - c(1)).^2),(X(2)-b(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2+ (X(3) - c(1)).^2),(X(3)-c(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2+ (X(3) - c(1)).^2)];
            J2 = [(X(1)-a(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2),(X(2)-b(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2),(X(3)-c(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2)];
            J3 = [(X(1)-a(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2),(X(2)-b(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2),(X(3)-c(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2)];
            J4 = [(X(1)-a(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2),(X(2)-b(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2),(X(3)-c(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2)];

            J = [J1;J2;J3;J4];


            F1_set(n) = abs(F(1));
            F2_set(n) = abs(F(2));
            F3_set(n) = abs(F(3));
            F4_set(n) = abs(F(4));

            F1_Set(n) = F(1);
            F2_Set(n) = F(2);
            F3_Set(n) = F(3);
            F4_Set(n) = F(4);    

            X1_set(n) = X(1);
            X2_set(n) = X(2);
            X3_set(n) = X(3);

            F_set = [F1_set ; F2_set ; F3_set ; F4_set];
            F_Realset = [F1_Set ; F2_Set ; F3_Set ; F4_Set];
            X_set = [X1_set ; X2_set ; X3_set];

            GG = ((J' * J)\ J') * F;
            X = X - GG;

            for k = 1 : repeat
                F_sum = sum(F_set);
                F_summin = min(F_sum);

                if F_sum(k) == F_summin
                    A = X_set(:, k);
                    ERROR_ = Y-X_set(:, k);
                    Real_set = F_Realset(:, k);
                    ERROR_distance = sqrt(ERROR_(1)^2+ERROR_(2)^2+ERROR_(3)^2);
                    break;
                end             
            end
        end
        Save(:, i) = A;
    end
    
    L = max(i) * (h-3);
    for size = (L + 1) : 1 : max(i) * max(h-2)
        Rem = rem(size, max(i));
        if Rem == 0
            Rem = 6;
        end
        PredictionPoint(:, size) = Save(:, Rem)
    end
end
clearvars -except PredictionPoint;