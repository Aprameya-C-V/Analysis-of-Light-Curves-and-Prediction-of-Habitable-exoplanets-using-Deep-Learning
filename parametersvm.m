% Confusion Matrix
C = [1983, 0; 53, 0];  % Replace this with your confusion matrix

% True Positive (TP), True Negative (TN), False Positive (FP), False Negative (FN)
TP = C(2, 2);
TN = C(1, 1);
FP = C(1, 2);
FN = C(2, 1);



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

% False Positive Rate
FPR = FP / (FP + TN);

% False Discovery Rate
FDR = FP / (TP + FP);

% Matthews Correlation Coefficient
MCC = (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN));

% Prevalence
prevalence = (TP + FN) / (TP + TN + FP + FN);

% Balanced Accuracy
balanced_accuracy = (sensitivity + specificity) / 2;

% Area Under the ROC Curve (AUC-ROC)
[X_roc, Y_roc, ~, AUC_roc] = perfcurve(yTest, yPred, 1);

% Display Results
disp(['Sensitivity (True Positive Rate): ' num2str(sensitivity)]);
disp(['Specificity (True Negative Rate): ' num2str(specificity)]);
disp(['Precision (Positive Predictive Value): ' num2str(precision)]);
disp(['Negative Predictive Value: ' num2str(NPV)]);
disp(['F1 Score: ' num2str(F1_score)]);
disp(['False Positive Rate: ' num2str(FPR)]);
disp(['False Discovery Rate: ' num2str(FDR)]);
disp(['Matthews Correlation Coefficient: ' num2str(MCC)]);
disp(['Prevalence: ' num2str(prevalence)]);
disp(['Balanced Accuracy: ' num2str(balanced_accuracy)]);
disp(['Area Under the ROC Curve (AUC-ROC): ' num2str(AUC_roc)]);

% Plot ROC Curve
figure;
plot(X_roc, Y_roc);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title('ROC Curve');

% Additional Metrics
Jaccard_Index = TP / (TP + FP + FN);
Informedness = sensitivity + specificity - 1;
Markedness = precision + NPV - 1;
G_Mean = sqrt(sensitivity * specificity);
expected_accuracy = (TP + FN) * (TP + FP) / ((TP + FN + TN + FP)^2);
Cohens_Kappa = (accuracy - expected_accuracy) / (1 - expected_accuracy);
[~, idx] = max(abs(X_roc - Y_roc));
ROC_Threshold = X_roc(idx);
K = 5;
precision_at_K = sum(yPred(1:K) == 1) / K;
recall_at_K = sum(yPred(1:K) == 1) / sum(yTest == 1);
FMI = sqrt(precision * sensitivity);


% Display Additional Metrics
disp(['Jaccard Index: ' num2str(Jaccard_Index)]);
disp(['Informedness: ' num2str(Informedness)]);
disp(['Markedness: ' num2str(Markedness)]);
disp(['G-Mean: ' num2str(G_Mean)]);
disp(['Cohen''s Kappa: ' num2str(Cohens_Kappa)]);
disp(['ROC Threshold: ' num2str(ROC_Threshold)]);
disp(['Precision at K = ' num2str(K) ': ' num2str(precision_at_K)]);
disp(['Recall at K = ' num2str(K) ': ' num2str(recall_at_K)]);
disp(['Fowlkes-Mallows Index (FMI): ' num2str(FMI)]);
disp(['Adjusted Rand Index (ARI): ' num2str(ARI)]);
