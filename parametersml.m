% Define the confusion matrix
confusionMatrix = [1983, 0; 53, 0];

% Calculate True Positives (TP), True Negatives (TN), False Positives (FP), and False Negatives (FN)
TP = confusionMatrix(1, 1);
TN = confusionMatrix(2, 2);
FP = confusionMatrix(2, 1);
FN = confusionMatrix(1, 2);

% Calculate Accuracy (ACC)
accuracy = (TP + TN) / (TP + TN + FP + FN);

% Calculate Precision
precision = TP / (TP + FP);

% Calculate Recall (Sensitivity)
recall = TP / (TP + FN);

% Calculate Specificity
specificity = TN / (TN + FP);

% Calculate F1-Score
f1Score = 2 * (precision * recall) / (precision + recall);

% Calculate False Positive Rate (FPR)
fpr = FP / (FP + TN);

% Calculate False Negative Rate (FNR)
fnr = FN / (FN + TP);

% Calculate Matthews Correlation Coefficient (MCC)
mcc = (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN));

% Display the calculated metrics
disp(['Accuracy: ' num2str(accuracy)]);
disp(['Precision: ' num2str(precision)]);
disp(['Recall: ' num2str(recall)]);
disp(['Specificity: ' num2str(specificity)]);
disp(['F1-Score: ' num2str(f1Score)]);
disp(['False Positive Rate (FPR): ' num2str(fpr)]);
disp(['False Negative Rate (FNR): ' num2str(fnr)]);
disp(['Matthews Correlation Coefficient (MCC): ' num2str(mcc)]);
