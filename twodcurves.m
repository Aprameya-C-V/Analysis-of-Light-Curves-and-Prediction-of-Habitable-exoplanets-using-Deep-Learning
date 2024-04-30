% Load and preprocess your dataset here
data=readtable('updated_dataset.csv');

% Define the input features and target variable
X = data.st_pmralim;  % Use the 'st_pmralim' column as the binary predictor
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

% ... (existing code remains the same)

% Train the neural network
[net, tr] = train(net, XTrain', yTrain', 'useParallel', 'yes');

% Plotting training and validation accuracy
figure;
plot(1:tr.num_epochs, tr.trainb, 'b', 1:tr.num_epochs, tr.vperf, 'r');
xlabel('Epoch');
ylabel('Accuracy');
legend('Training Accuracy', 'Validation Accuracy');
title('Training and Validation Accuracy vs Epoch');

% Plotting training and validation loss
figure;
plot(1:tr.num_epochs, tr.trainrp, 'b', 1:tr.num_epochs, tr.vperf, 'r');
xlabel('Epoch');
ylabel('Loss');
legend('Training Loss', 'Validation Loss');
title('Training and Validation Loss vs Epoch');
