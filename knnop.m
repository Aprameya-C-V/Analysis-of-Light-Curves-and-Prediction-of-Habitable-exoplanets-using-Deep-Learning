% Calculate evaluation metrics
precision = sum((yPred == 1) & (yTest == 1)) / sum(yPred == 1);
recall = sum((yPred == 1) & (yTest == 1)) / sum(yTest == 1);
accuracy = sum(yPred == yTest) / numel(yTest);
f1_score = 2 * (precision * recall) / (precision + recall);

disp(['Precision: ' num2str(precision)]);
disp(['Recall: ' num2str(recall)]);
disp(['Accuracy: ' num2str(accuracy)]);
disp(['F1 Score: ' num2str(f1_score)]);
