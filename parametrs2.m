% Define the confusion matrix
confusionMatrix = [1983, 0; 53, 0];

% Calculate True Positives (TP), True Negatives (TN), False Positives (FP), and False Negatives (FN)
TP = confusionMatrix(1, 1);
TN = confusionMatrix(2, 2);
FP = confusionMatrix(2, 1);
FN = confusionMatrix(1, 2);

% Calculate False Discovery Rate (FDR)
FDR = FP / (TP + FP);

% Calculate Negative Predictive Value (NPV)
NPV = TN / (TN + FN);

% Calculate Prevalence
prevalence = (TP + FN) / (TP + TN + FP + FN);

% Calculate Balanced Accuracy
balancedAccuracy = (TP / (TP + FN) + TN / (TN + FP)) / 2;

% Calculate Geometric Mean (G-Mean)
gMean = sqrt(TP / (TP + FN) * TN / (TN + FP));

% Calculate Informedness (Youden's J statistic)
informedness = TP / (TP + FN) + TN / (TN + FP) - 1;

% Calculate Markedness
markedness = TP / (TP + FP) + TN / (TN + FN) - 1;

% ROC and AUC metrics are typically calculated using specialized functions, not manually.

% Display the calculated metrics
disp(['False Discovery Rate (FDR): ' num2str(FDR)]);
disp(['Negative Predictive Value (NPV): ' num2str(NPV)]);
disp(['Prevalence: ' num2str(prevalence)]);
disp(['Balanced Accuracy: ' num2str(balancedAccuracy)]);
disp(['Geometric Mean (G-Mean): ' num2str(gMean)]);
disp(['Informedness (Youden''s J statistic): ' num2str(informedness)]);
disp(['Markedness: ' num2str(markedness)]);
