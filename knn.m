% Load the dataset
data = readtable('updated_dataset.csv');

% Define the predictor variables and the target variable
X = data{:, {'st_pmralim', 'pl_tranmid', 'pl_orbper', 'pl_trandurh', 'pl_trandep', 'pl_rade', 'pl_insol', 'pl_eqt', 'st_tmag', 'st_dist', 'st_teff', 'st_logg', 'st_rad'}};
y = data.target;

% Split the data into training and testing sets
rng(42);  % Set a random seed for reproducibility
cv = cvpartition(y, 'HoldOut', 0.3);  % 70% for training, 30% for testing

XTrain = X(training(cv), :);
yTrain = y(training(cv));
XTest = X(test(cv), :);
yTest = y(test(cv));

% Train the k-Nearest Neighbors model
K = 3;  % Set the number of neighbors
KNNModel = fitcknn(XTrain, yTrain, 'NumNeighbors', K);

% Predict on the test set
yPred = predict(KNNModel, XTest);

% Evaluate the model's performance
accuracy = sum(yPred == yTest) / numel(yTest);

disp(['KNN Model Accuracy: ' num2str(accuracy)]);
