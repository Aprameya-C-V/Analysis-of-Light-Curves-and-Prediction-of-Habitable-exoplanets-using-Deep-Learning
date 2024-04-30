% Get confusion matrix values (replace this with your actual confusion matrix)
C = [1983 1; 45 0];

% Calculate metrics
TP = C(1,1); % True Positives
TN = C(2,2); % True Negatives
FP = C(2,1); % False Positives
FN = C(1,2); % False Negatives

% Calculate metrics
accuracy = (TP + TN) / sum(C(:));
precision = TP / (TP + FP);
recall = TP / (TP + FN);
specificity = TN / (TN + FP);
f1_score = 2 * (precision * recall) / (precision + recall);

% Display metrics
disp(['Accuracy: ' num2str(accuracy)]);
disp(['Precision: ' num2str(precision)]);
disp(['Recall (Sensitivity): ' num2str(recall)]);
disp(['Specificity: ' num2str(specificity)]);
disp(['F1-Score: ' num2str(f1_score)]);
