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


% Calculate other metrics
TP = C(1, 1);
TN = C(2, 2);
FP = C(2, 1);
FN = C(1, 2);

% Sensitivity (True Positive Rate)
sensitivity = TP / (TP + FN);

% Specificity (True Negative Rate)
specificity = TN / (TN + FP);

% Precision (Positive Predictive Value)
precision = TP / (TP + FP);

% Negative Predictive Value
NPV = TN / (TN + FN);

% F1 Score
F1_score = 2 * (precision * sensitivity) / (precision + sensitivity);

% Display other metrics
disp(['Sensitivity (True Positive Rate): ' num2str(sensitivity)]);
disp(['Specificity (True Negative Rate): ' num2str(specificity)]);
disp(['Precision (Positive Predictive Value): ' num2str(precision)]);
disp(['Negative Predictive Value: ' num2str(NPV)]);
disp(['F1 Score: ' num2str(F1_score)]);
% Add other metrics as needed
% Additional Metrics

% 1. False Positive Rate
FPR = FP / (FP + TN);

% 2. False Discovery Rate
FDR = FP / (TP + FP);

% 3. Matthews Correlation Coefficient
MCC = (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN));

% 4. Prevalence
prevalence = (TP + FN) / (TP + TN + FP + FN);

% 5. Balanced Accuracy
balanced_accuracy = (sensitivity + specificity) / 2;

% 6. Area Under the ROC Curve (AUC-ROC)
[X_roc, Y_roc, ~, AUC_roc] = perfcurve(yTest, yPred, 1);

% 7. Jaccard Index (Intersection over Union)
Jaccard_Index = TP / (TP + FP + FN);

% 8. Informedness (Youden's J statistic)
Informedness = sensitivity + specificity - 1;

% 9. Markedness
Markedness = precision + NPV - 1;

% 10. G-Mean (Geometric Mean)
G_Mean = sqrt(sensitivity * specificity);

% 11. Cohen's Kappa
expected_accuracy = (TP + FN) * (TP + FP) / ((TP + FN + TN + FP)^2);
Cohens_Kappa = (accuracy - expected_accuracy) / (1 - expected_accuracy);

% 12. Receiver Operating Characteristic (ROC) Threshold Value
[~, idx] = max(abs(X_roc - Y_roc));
ROC_Threshold = X_roc(idx);

% 13. Precision at K (e.g., K = 5)
K = 5;
precision_at_K = sum(yPred(1:K) == 1) / K;

% 14. Recall at K
recall_at_K = sum(yPred(1:K) == 1) / sum(yTest == 1);

% 15. Fowlkes-Mallows Index (FMI)
FMI = sqrt(precision * sensitivity);




% 17. Precision-Recall AUC
[X_prc, Y_prc, ~, AUC_prc] = perfcurve(yTest, yPred, 1, 'xCrit', 'reca', 'yCrit', 'prec');

% 18. Fall-out (False Positive Rate for Precision-Recall)
fallout = FP / (FP + TN);

% 19. Area Under the Precision-Recall Curve (AUC-PR)
AUC_PR = trapz(X_prc, Y_prc);

% 20. Precision-Recall Threshold Value
[~, idx_pr] = max(abs(X_prc - Y_prc));
PR_Threshold = X_prc(idx_pr);

% Display Additional Metrics
disp(['False Positive Rate: ' num2str(FPR)]);
disp(['False Discovery Rate: ' num2str(FDR)]);
disp(['Matthews Correlation Coefficient: ' num2str(MCC)]);
disp(['Prevalence: ' num2str(prevalence)]);
disp(['Balanced Accuracy: ' num2str(balanced_accuracy)]);
disp(['Area Under the ROC Curve (AUC-ROC): ' num2str(AUC_roc)]);
disp(['Jaccard Index: ' num2str(Jaccard_Index)]);
disp(['Informedness: ' num2str(Informedness)]);
disp(['Markedness: ' num2str(Markedness)]);
disp(['G-Mean: ' num2str(G_Mean)]);
disp(['Cohen''s Kappa: ' num2str(Cohens_Kappa)]);
disp(['ROC Threshold: ' num2str(ROC_Threshold)]);
disp(['Precision at K = ' num2str(K) ': ' num2str(precision_at_K)]);
disp(['Recall at K = ' num2str(K) ': ' num2str(recall_at_K)]);
disp(['Fowlkes-Mallows Index (FMI): ' num2str(FMI)]);
disp(['Precision-Recall AUC: ' num2str(AUC_prc)]);
disp(['Fall-out: ' num2str(fallout)]);
disp(['Area Under the Precision-Recall Curve (AUC-PR): ' num2str(AUC_PR)]);
disp(['Precision-Recall Threshold: ' num2str(PR_Threshold)]);

