clear all;
clc

X1 = importdata('D:\matlab\igyz project\root1.csv');
roll = X1.data(:, 1);
yaw  = X1.data(:, 2);
len = length(roll)-49;
Accz = X1.data(:, 1);
lenz = length(Accz);
A = zeros(len,1);
B = zeros(len,1);
C = zeros(len+49,1);


for st = 1:len
    en = st:(49+st);
       A(st) = sum(roll(en)) * 0.06;
       B(st) = sum(yaw(en)) * 0.06;
       C(st+49) = sqrt(A(st).^2 + B(st).^2);

end

figure
%plot((1:len+49)*0.06,C,'-');
hold on;
plot((1:lenz)*0.06,Accz,'-');
hold on;
plot((1:lenz)*0.06,yaw,'-');
grid on