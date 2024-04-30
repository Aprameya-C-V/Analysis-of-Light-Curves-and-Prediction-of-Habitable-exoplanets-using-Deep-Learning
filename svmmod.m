% Load the dataset
data = readtable('updated_dataset.csv'); % Replace with the actual file path

% Define the binary predictor variables and the target variable
X = data{:, {'st_teff', 'st_rad', 'pl_orbper', 'pl_rade', 'pl_insol'}}; % Adjust features as needed
y = categorical(data.tfopwg_disp); % Assuming 'tfopwg_disp' is the column indicating disposition

% Split the data into training and testing sets
rng(42); % Set a random seed for reproducibility
cv = cvpartition(y, 'HoldOut', 0.3); % 70% for training, 30% for testing

XTrain = X(training(cv), :);
yTrain = y(training(cv));
XTest = X(test(cv), :);
yTest = y(test(cv));

% Train the SVM model with 'fitcecoc'
SVMModel = fitcecoc(XTrain, yTrain, 'Learners', 'linear', 'Coding', 'onevsone');

% Predict on the test set
yPred = predict(SVMModel, XTest);

% Evaluate the model's performance
accuracy = sum(yPred == yTest) / numel(yTest);

% Display accuracy
disp(['SVM Model Accuracy: ' num2str(accuracy)]);



% Calculate F1 Score
precision = diag(C)./sum(C,2);
recall = diag(C)./sum(C,1)';
f1_score = 2 * (precision .* recall) ./ (precision + recall);

% Display F1 Score
disp(['F1 Score (CP): ' num2str(f1_score(1))]);
disp(['F1 Score (FP): ' num2str(f1_score(2))]);
disp(['F1 Score (KP): ' num2str(f1_score(3))]);
disp(['F1 Score (PC): ' num2str(f1_score(4))]);
