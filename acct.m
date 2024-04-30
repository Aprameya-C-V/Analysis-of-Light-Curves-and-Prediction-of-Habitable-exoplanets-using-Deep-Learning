% Load and preprocess your dataset here
data = readtable('updated_dataset.csv');

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

% Configure training options
net.trainParam.epochs = 500; % Set the maximum number of epochs
net.trainParam.max_fail = 500; % Set a large value to avoid stopping early
net.trainParam.min_grad = 1e-51; % Set a small minimum gradient tolerance
net.trainParam.lr = 0.01; % Set an appropriate learning rate

% Train the neural network
[net, tr] = train(net, XTrain', yTrain');

% Make predictions
yPred = net(XTest');

% Evaluate the model's performance
accuracy = sum(round(yPred) == yTest) / numel(yTest);
disp(['2D Neural Network Accuracy: ' num2str(accuracy)]);

% Displaying epoch-related specifications
fprintf('Total number of epochs: %d\n', tr.num_epochs);
fprintf('Training time: %f seconds\n', tr.time(end));

% Display epoch timestamps and losses for each epoch
fprintf('Epoch Timestamps and Losses:\n');
for epoch = 1:tr.num_epochs
    fprintf('Epoch %d - Training Loss: %f, Validation Loss: %f\n', epoch, tr.perf(epoch), tr.vperf(epoch));
    % Display other characteristics for each epoch here
    
    % Calculate accuracies for each epoch
    yPredTrain = net(XTrain');
    trainAccuracy = sum(round(yPredTrain) == yTrain) / numel(yTrain);
    
    yPredVal = net(XTest');
    validationAccuracy = sum(round(yPredVal) == yTest) / numel(yTest);
    
    fprintf('Epoch %d - Training Accuracy: %f, Validation Accuracy: %f\n', epoch, trainAccuracy, validationAccuracy);
end
