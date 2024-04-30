% Assuming 'XTrain', 'yTrain', 'XTest', and 'yTest' contain the training and testing data

% Hyperparameter tuning using cross-validation
Mdl = fitrsvm(XTrain, yTrain, 'OptimizeHyperparameters', 'auto', ...
    'HyperparameterOptimizationOptions', struct('AcquisitionFunctionName', 'expected-improvement-plus'));

% Get the best hyperparameters
bestParams = Mdl.HyperparameterOptimizationResults.XAtMinObjective;

% Train the model with the best hyperparameters
svmModel = fitrsvm(XTrain, yTrain, 'KernelFunction', bestParams.KernelFunction, 'BoxConstraint', bestParams.BoxConstraint, 'Standardize', true);

% Predict using the optimized model
predictedWeights = predict(svmModel, XTest);

% Calculate R-squared value
rsquared = corr(yTest, predictedWeights)^2;

% Calculate RMSE value
rmse = sqrt(mean((predictedWeights - yTest).^2));

% Display the updated performance metrics
disp(['Updated R-squared value: ', num2str(rsquared)]);
disp(['Updated RMSE: ', num2str(rmse)]);
