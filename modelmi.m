% Assuming 'syntheticData_5G' contains features (X) and target (y)

% Extracting features and target variable
X = syntheticData_5G{:, {'signalStrengths_mmWave', 'interference_mmWave', 'userPositionsX', 'userPositionsY'}};
y = syntheticData_5G{:, 'beamformingWeights'};

% Splitting data into training and testing sets (70-30 split)
cv = cvpartition(size(X, 1), 'HoldOut', 0.3);
idxTrain = training(cv);
XTrain = X(idxTrain,:);
yTrain = y(idxTrain,:);
XTest  = X(~idxTrain,:);
yTest  = y(~idxTrain,:);

% Choosing an SVM regression model
svmModel = fitrsvm(XTrain, yTrain, 'KernelFunction', 'gaussian', 'Standardize', true);

% Predicting using the model on test data
predictedWeights = predict(svmModel, XTest);

% Calculating R-squared value
rsquared = corr(yTest, predictedWeights)^2;

% Calculating RMSE value
rmse = sqrt(mean((predictedWeights - yTest).^2));

% Displaying model performance (R-squared and RMSE)
disp(['R-squared value of the SVM model: ', num2str(rsquared)]);
disp(['Root Mean Squared Error (RMSE): ', num2str(rmse)]);
