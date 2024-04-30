% Load and preprocess your dataset here
data = readtable('updated_dataset.csv');

% Define the input features and target variable
X = data.st_pmralim;  % Using 'st_pmralim' column as the binary predictor
y = data.target;

% Split the data into training and testing sets
rng(42);  % Set a random seed for reproducibility
cv = cvpartition(y, 'HoldOut', 0.3);  % 70% for training, 30% for testing

XTrain = X(training(cv));
yTrain = y(training(cv));
XTest = X(test(cv));
yTest = y(test(cv));

% Create a neural network
net = patternnet(10);  % Define the architecture of the neural network

% Train the neural network
net = train(net, XTrain', yTrain');

% Make predictions
yPred = net(XTest');

% Evaluate the model's performance
accuracy = sum(round(yPred) == yTest) / numel(yTest);
disp(['2D Neural Network Accuracy: ' num2str(accuracy)]);

% Compute Confusion Matrix
TP = sum(yTest == 1 & round(yPred) == 1);
FP = sum(yTest == 0 & round(yPred) == 1);
FN = sum(yTest == 1 & round(yPred) == 0);
TN = sum(yTest == 0 & round(yPred) == 0);

C = [TP FP; FN TN];
disp('Confusion Matrix:');
disp(C);
