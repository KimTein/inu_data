clc;
clear;

N = 1000;

m1 = [10 ; 5];
v1 = [25 0; 0 9];
m2 = [10; 5];
v2 = [5 -3;-3 10];
m3 = [2; 5];
v3 = [5 -3;-3 10];


% Generate 1000 samples from each Gaussian distribution
x1 = mvnrnd(m1, v1, N);
x2 = mvnrnd(m2, v2, N);
x3 = mvnrnd(m3, v3, N);


% Visualizing each data scatter plot
figure;
subplot(1,3,1)
scatter(x1(:,1), x1(:,2), 'r'); 
xlabel('X');
ylabel('Y');
title('Distribution 1');

subplot(1,3,2)
scatter(x2(:,1), x2(:,2),'g');
xlabel('X');
ylabel('Y');
title('Distribution 2');

subplot(1,3,3)
scatter(x3(:,1), x3(:,2),'b');
xlabel('X');
ylabel('Y');
title('Distribution 3');

% Visualizing distribution in one figure
figure;
scatter(x1(:,1), x1(:,2), 15,'marker','x'); hold on;
scatter(x2(:,1), x2(:,2), 15,'marker','o'); 
scatter(x3(:,1), x3(:,2), 15,'marker','*'); 
xlabel('X')
ylabel('Y')
title('Gaussian Distributions');
legend('Distribution 1', 'Distribution 2', 'Distribution 3');

% Define x and y ranges for plotting the contours
mesh_x1 = linspace(-5, 25, 1000);
mesh_x2 = linspace(-5, 15, 1000);
[X1, X2] = meshgrid(mesh_x1, mesh_x2);
X = [X1(:), X2(:)];

% Calculate the pdf values for each distribution at each point in the meshgrid
y1 = mvnpdf(X, m1', v1);
y2 = mvnpdf(X, m2', v2);
y3 = mvnpdf(X, m3', v3);

% Reshape the pdf values to match the dimensions of X and Y for contour plotting
y1 = reshape(y1, size(X1));
y2 = reshape(y2, size(X1));
y3 = reshape(y3, size(X1));

% Plot the pdf contours
figure;
contour(X1,X2,y1, 'LineColor', 'r'); hold on;
contour(X1,X2,y2, 'LineColor', 'g');
contour(X1,X2,y3, 'LineColor', 'b');
xlabel('X1');
ylabel('X2');
title('Gaussian Distributions');
legend('Distribution 1', 'Distribution 2', 'Distribution 3');
hold off;

% Visualizing pdf to surface plot
figure;
surf(X1, X2,y1, 'edgecolor','none'); hold on;
surf(X1, X2, y2, 'edgecolor','none');
surf(X1, X2, y3, 'edgecolor','none');
xlabel('X1');
ylabel('X2');
title('Gaussian Distributions');
legend('Distribution 1', 'Distribution 2', 'Distribution 3');
hold off;