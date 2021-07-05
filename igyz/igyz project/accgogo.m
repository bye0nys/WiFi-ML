clear all;
clc

global o
X1= importdata('12.2.1.csv');
X2= importdata('12.2.2.csv');
X3= importdata('12.2.3.csv');
X4= importdata('12.2.4.csv'); 
X=[0;0;0];
%X=[3;5;1];
%X=[5;4;5];
%X=[1;2;4];
%X=[-4;-2;-3];
%X=[-3;-1;-2];

B1 = X1(:, 3) 
B2 = X2(:, 3) 
B3 = X3(:, 3) 
B4 = X4(:, 3) 
B1_ = B1(1:900);
B2_ = B2(1:900);
B3_ = B3(1:900);
B4_ = B4(1:900);
B1_mat = reshape(B1_, [100, 9]);
B2_mat = reshape(B2_, [100, 9]);
B3_mat = reshape(B3_, [100, 9]);
B4_mat = reshape(B4_, [100, 9]);
B1_mean = mean(B1_mat);
B2_mean = mean(B2_mat);
B3_mean = mean(B3_mat);
B4_mean = mean(B4_mat);
a = [6.5;0;0;6.5]; % x
b = [9.5;9.5;0;0]; % y
c = [1.6;1.6;1.6;1.6];   % z

repeat = 500;

F1_set = zeros(1, repeat);
F2_set = zeros(1, repeat);
F3_set = zeros(1, repeat);
F4_set = zeros(1, repeat);
F5_set = zeros(1, repeat);
F6_set = zeros(1, repeat);
F7_set = zeros(1, repeat);
F8_set = zeros(1, repeat);
F9_set = zeros(1, repeat);
F10_set = zeros(1, repeat);
F1_Set = zeros(1, repeat);
F2_Set = zeros(1, repeat);
F3_Set = zeros(1, repeat);
F4_Set = zeros(1, repeat);
F5_Set = zeros(1, repeat);
F6_Set = zeros(1, repeat);
F7_Set = zeros(1, repeat);
F8_Set = zeros(1, repeat);
F9_Set = zeros(1, repeat);
F10_Set = zeros(1, repeat);

X1_set = zeros(1, repeat);
X2_set = zeros(1, repeat);
X3_set = zeros(1, repeat);
for o=1:1:9
    for n = 1 : 500
    
    r = [B1_mean(o);B2_mean(o);B3_mean(o);B4_mean(o)];   % r 

    F1 = sqrt((X(1) - a(1)).^2 + (X(2)-b(1)).^2 + (X(3) - c(1)).^2) - r(1);
    F2 = sqrt((X(1) - a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2) - r(2);
    F3 = sqrt((X(1) - a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2) - r(3);
    F4 = sqrt((X(1) - a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2) - r(4);
    F5 = sqrt((X(1) - a(1)).^2 + (X(2) - b(1)).^2 + ((X(3) - c(1)).^2)) + sqrt((X(1) - a(2)).^2 + (X(2) - b(2)).^2 + ((X(3) - c(2)).^2)) -r(1) - r(2);
    F6 = sqrt((X(1) - a(1)).^2 + (X(2) - b(1)).^2 + ((X(3) - c(1)).^2)) + sqrt((X(1) - a(4)).^2 + (X(2) - b(4)).^2 + ((X(3) - c(4)).^2)) -r(1) - r(4);
    F7 = sqrt((X(1) - a(3)).^2 + (X(2) - b(3)).^2 + ((X(3) - c(3)).^2)) + sqrt((X(1) - a(4)).^2 + (X(2) - b(4)).^2 + ((X(3) - c(4)).^2)) -r(3) - r(4);
    F8 = sqrt((X(1) - a(3)).^2 + (X(2) - b(3)).^2 + ((X(3) - c(3)).^2)) + sqrt((X(1) - a(2)).^2 + (X(2) - b(2)).^2 + ((X(3) - c(2)).^2)) -r(2) - r(3);
    F9 = sqrt((X(1) - a(1)).^2 + (X(2) - b(1)).^2 + ((X(3) - c(1)).^2)) + sqrt((X(1) - a(3)).^2 + (X(2) - b(3)).^2 + ((X(3) - c(3)).^2)) -r(1) - r(3);
    F10 = sqrt((X(1) - a(2)).^2 + (X(2) - b(2)).^2 + ((X(3) - c(2)).^2)) + sqrt((X(1) - a(4)).^2 + (X(2) - b(4)).^2 + ((X(3) - c(4)).^2)) -r(2) - r(4);
       
  
    F = [F1;F2;F3;F4;F5;F6;F7;F8;F9;F10];
    
    Qx = [((X(1)-a(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2 + (X(3) -c(1)).^2)),((X(1)-a(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) -c(2)).^2)),((X(1)-a(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) -c(3)).^2)),((X(1)-a(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) -c(4)).^2))];
    Qy = [((X(2)-b(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2 + (X(3) -c(1)).^2)),((X(2)-b(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) -c(2)).^2)),((X(2)-b(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) -c(3)).^2)),((X(2)-b(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) -c(4)).^2))];
    Qz = [((X(3)-c(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2 + (X(3) -c(1)).^2)),((X(3)-c(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) -c(2)).^2)),((X(3)-c(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) -c(3)).^2)),((X(3)-c(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) -c(4)).^2))];
          

    J1 = [(X(1)-a(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2 + (X(3) - c(1)).^2),(X(2)-b(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2+ (X(3) - c(1)).^2),(X(3)-c(1))./sqrt((X(1)-a(1)).^2 + (X(2)-b(1)).^2+ (X(3) - c(1)).^2)];
    J2 = [(X(1)-a(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2),(X(2)-b(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2),(X(3)-c(2))./sqrt((X(1)-a(2)).^2 + (X(2)-b(2)).^2 + (X(3) - c(2)).^2)];
    J3 = [(X(1)-a(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2),(X(2)-b(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2),(X(3)-c(3))./sqrt((X(1)-a(3)).^2 + (X(2)-b(3)).^2 + (X(3) - c(3)).^2)];
    J4 = [(X(1)-a(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2),(X(2)-b(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2),(X(3)-c(4))./sqrt((X(1)-a(4)).^2 + (X(2)-b(4)).^2 + (X(3) - c(4)).^2)];
    J5 = [Qx(1) + Qx(2), Qy(1) + Qy(2) , Qz(1) + Qz(2)];
    J6 = [Qx(1) + Qx(4) , Qy(1) + Qy(4) , Qz(1) + Qz(4)];
    J7 = [Qx(3) + Qx(4) , Qy(3) + Qy(4) , Qz(3) + Qz(4)];
    J8 = [Qx(3) + Qx(2) , Qy(3) + Qy(2) ,  Qz(3) + Qz(2)];
    J9 = [Qx(1) + Qx(3) , Qy(1) + Qy(3) , Qz(1) + Qz(3)];
    J10 = [Qx(2) + Qx(4) , Qy(2) + Qy(4) , Qz(2) + Qz(4)];
    J = [J1;J2;J3;J4;J5;J6;J7;J8;J9;J10];
  
    
    F1_set(n) = abs(F(1));
    F2_set(n) = abs(F(2));
    F3_set(n) = abs(F(3));
    F4_set(n) = abs(F(4));
    F5_set(n) = abs(F(5));
    F6_set(n) = abs(F(6));
    F7_set(n) = abs(F(7));
    F8_set(n) = abs(F(8));
    F9_set(n) = abs(F(9));
    F10_set(n) = abs(F(10));
    F1_Set(n) = F(1);
    F2_Set(n) = F(2);
    F3_Set(n) = F(3);
    F4_Set(n) = F(4);
    F5_Set(n) = F(5);
    F6_Set(n) = F(6);
    F7_Set(n) = F(7);
    F8_Set(n) = F(8);
    F9_Set(n) = F(9);
    F10_Set(n) = F(10);
    
     
    X1_set(n) = X(1);
    X2_set(n) = X(2);
    X3_set(n) = X(3);
    
    F_set = [F1_set ; F2_set ; F3_set ; F4_set; F5_set; F6_set; F7_set; F8_set; F9_set; F10_set];
    F_Realset = [F1_Set ; F2_Set ; F3_Set ; F4_Set; F5_Set; F6_Set; F7_Set; F8_Set; F9_Set; F10_Set];
    X_set = [X1_set ; X2_set ; X3_set];
        
    GG = ((J' * J)\ J') * F;
    X = X - GG;
    for k = 1 : repeat
        
    F_sum = sum(F_set);
    F_summin = min(F_sum);
    if F_sum(k) == F_summin
        if (o==1)
            PredictionPoint1 = X_set(:, k);
            break;

        elseif (o==2)
            PredictionPoint2 = X_set(:, k);
            break;

        elseif (o==3)
            PredictionPoint3 = X_set(:, k);
            break;

        elseif (o==4)
            PredictionPoint4 = X_set(:, k);
            break;

        elseif (o==5)
            PredictionPoint5 = X_set(:, k);
            break;

        elseif (o==6)
            PredictionPoint6 = X_set(:, k);
            break;

        elseif (o==7)
            PredictionPoint7 = X_set(:, k);
            break;

        elseif (o==8)
            PredictionPoint8 = X_set(:, k);
            break;

        elseif (o==9)
            PredictionPoint9 = X_set(:, k);
            break;
            

        ERROR_ = Y-X_set(:, k);
        F_Realset(:, k);
        %plot(X_set(1,k),X_set(2,k),'r^')
        ERROR_distance = sqrt(ERROR_(1)^2+ERROR_(2)^2+ERROR_(3)^2)
        hold on
        break;
        end
                
                
    end
    end    

    end
end
PredictionPoint=[PredictionPoint1,PredictionPoint2,PredictionPoint3,PredictionPoint4,PredictionPoint5,PredictionPoint6,PredictionPoint7,PredictionPoint8,PredictionPoint9]
