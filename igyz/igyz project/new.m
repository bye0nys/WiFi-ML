clear all;
clc

X1 = importdata('D:\matlab\igyz project\root1.csv');

roll = X1.data(:, 1); 
yaw  = X1.data(:, 2);

len = length(roll)-49;


B = zeros(len,1);
C = zeros(len,1);
D = zeros(len,1);

for st = 1:len
    en = st:(49+st);

    B(st) = sum(roll(en)) * 0.06;
    C(st) = sum(yaw(en)) * 0.06;
    D(st) = sqrt(B(st).^2 + C(st).^2);
end

figure
plot((1:len)*0.06,D,'--');
grid on;
