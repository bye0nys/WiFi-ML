clear all;

X5= importdata('5m.csv');
X10= importdata('10m.csv');
X15= importdata('15m.csv');
X20= importdata('20m.csv');
X25= importdata('25m.csv');
X30= importdata('30m.csv');
X35= importdata('35m.csv');
X40= importdata('40m.csv');
X45= importdata('45m.csv');
X50= importdata('50m.csv');

C = [];
D = [];
A5 = X5(:, 1);
B5 = X5(:, 3);
C = mean(A5 - B5);
D= var(A5 - B5);

A10 = X10(:, 1);
B10 = X10(:, 3);
C= [C,mean(A10 - B10)];
D= [D,var(A10 - B10)];


A15 = X15(:, 1);
B15 = X15(:, 3);
C=[C,mean(A15 - B15)];
D=[D,var(A15 - B15)];


A20 = X20(:, 1);
B20 = X20(:, 3);
C=[C,mean(A20 - B20)];
D=[D,var(A20 - B20)];


A25 = X25(:, 1);
B25 = X25(:, 3);
C=[C,mean(A25 - B25)];
D=[D,var(A25 - B25)];


A30 = X30(:, 1);
B30 = X30(:, 3);
C=[C,mean(A30 - B30)];
D=[D,var(A30 - B30)];


A35 = X35(:, 1);
B35 = X35(:, 3);
C= [C,mean(A35 - B35)];
D=[D,var(A35 - B35)];


A40 = X40(:, 1);
B40 = X40(:, 3);
C=[C,mean(A40 - B40)];
D=[D,var(A40 - B40)];


A45 = X45(:, 1);
B45 = X45(:, 3);
C=[C,mean(A45 - B45)];
D=[D,var(A45 - B45)];

A50 = X50(:, 1);
B50 = X50(:, 3);
C=[C,mean(A50 - B50)];
D=[D,var(A50 - B50)];

X1 = 5000:5000:50000
figure
plot(X1,C,'--');

title('Mean value of Error');
xlabel('5M ~ 50M');
ylabel('Mean Error[mm]');
hold on;

figure
plot(X1,D,'--');

title('Variance value of Error');
xlabel('5M ~ 50M');
ylabel('Variance Error[mm]');
hold on;