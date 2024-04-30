% Load the dataset
data = readtable('updated_dataset.csv');

% Define the binary predictor variable and the target variable
X = data.st_pmralim;  % Use the 'st_pmralim' column as the binary predictor
y = data.target;

% Split the data into training and testing sets
rng(42);  % Set a random seed for reproducibility
cv = cvpartition(y, 'HoldOut', 0.3);  % 70% for training, 30% for testing

XTrain = X(training(cv));
yTrain = y(training(cv));
XTest = X(test(cv));
yTest = y(test(cv));

% Train the SVM model
SVMModel = fitcsvm(XTrain, yTrain, 'KernelFunction', 'linear');

% Predict on the test set
yPred = predict(SVMModel, XTest);

% Evaluate the model's performance
accuracy = sum(yPred == yTest) / numel(yTest);

disp(['SVM Model Accuracy: ' num2str(accuracy)]);

% True Positive (TP), True Negative (TN), False Positive (FP), False Negative (FN)
TP = sum(yTest == 1 & yPred == 1);
TN = sum(yTest == 0 & yPred == 0);
FP = sum(yTest == 0 & yPred == 1);
FN = sum(yTest == 1 & yPred == 0);

% Confusion Matrix
C = [TN, FP; FN, TP];

% Display the Confusion Matrix
disp('Confusion Matrix:');
disp(C);

% Display TP, TN, FP, FN
disp(['True Positive (TP): ' num2str(TP)]);
disp(['True Negative (TN): ' num2str(TN)]);
disp(['False Positive (FP): ' num2str(FP)]);
disp(['False Negative (FN): ' num2str(FN)]);
