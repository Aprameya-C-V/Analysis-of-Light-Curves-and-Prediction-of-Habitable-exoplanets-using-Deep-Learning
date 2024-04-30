TP = 1983; % True Positives
TN = 0;    % True Negatives
FP = 1;    % False Positives
FN = 53;  % False Negatives

% Calculate metrics
accuracy = (TP + TN) / (TP + TN + FP + FN);
precision = TP / (TP + FP);
recall = TP / (TP + FN);
specificity = TN / (TN + FP);
f1_score = 2 * (precision * recall) / (precision + recall);
false_positive_rate = FP / (FP + TN);
false_negative_rate = FN / (FN + TP);
false_discovery_rate = FP / (FP + TP);
negative_predictive_value = TN / (TN + FN);
false_omission_rate = FN / (TN + FN);
positive_predictive_value = TP / (TP + FP);
prevalence = (TP + FN) / (TP + TN + FP + FN);
positive_likelihood_ratio = recall / (1 - specificity);
negative_likelihood_ratio = (1 - recall) / specificity;
diagnostic_odds_ratio = positive_likelihood_ratio / negative_likelihood_ratio;
youden_index = recall + specificity - 1;
markedness = precision + negative_predictive_value - 1;
informedness = recall + specificity - 1;
matthews_correlation_coefficient = (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN));
adjusted_rand_index = (TP + TN) / (TP + TN + FP + FN);
fowlkes_mallows_index = sqrt(TP^2 / ((TP + FP) * (TP + FN)));
cohen_kappa = (accuracy - prevalence) / (1 - prevalence);
g_measure = sqrt(recall * specificity);
weighted_accuracy = (recall + specificity) / 2;
balanced_accuracy = (recall + specificity) / 2;
jaccard_index = TP / (TP + FP + FN);
hamming_loss = (FP + FN) / (TP + TN + FP + FN);
mutual_information = (TP / (TP + FN)) * log2((TP * (TP + TN)) / ((TP + FN) * (TP + FP)));
variation_of_information = -(TP * log2(TP / (TP + FN)) + FN * log2(FN / (TP + FN)) + FP * log2(FP / (TN + FP)) + TN * log2(TN / (TN + FP))) / (TP + FN + FP + TN);
goodman_kruskal_lambda = (TP * TN - FP * FN) / ((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN));

% Display the calculated metrics
disp(['Accuracy: ' num2str(accuracy)]);
disp(['Precision: ' num2str(precision)]);
disp(['Recall (Sensitivity): ' num2str(recall)]);
disp(['Specificity: ' num2str(specificity)]);
disp(['F1-Score: ' num2str(f1_score)]);
disp(['False Positive Rate: ' num2str(false_positive_rate)]);
disp(['False Negative Rate: ' num2str(false_negative_rate)]);
disp(['False Discovery Rate: ' num2str(false_discovery_rate)]);
disp(['Negative Predictive Value: ' num2str(negative_predictive_value)]);
disp(['False Omission Rate: ' num2str(false_omission_rate)]);
disp(['Positive Predictive Value: ' num2str(positive_predictive_value)]);
disp(['Prevalence: ' num2str(prevalence)]);
disp(['Positive Likelihood Ratio: ' num2str(positive_likelihood_ratio)]);
disp(['Negative Likelihood Ratio: ' num2str(negative_likelihood_ratio)]);
disp(['Diagnostic Odds Ratio: ' num2str(diagnostic_odds_ratio)]);
disp(['Youden Index: ' num2str(youden_index)]);
disp(['Markedness: ' num2str(markedness)]);
disp(['Informedness: ' num2str(informedness)]);
disp(['Matthews Correlation Coefficient: ' num2str(matthews_correlation_coefficient)]);
disp(['Adjusted Rand Index: ' num2str(adjusted_rand_index)]);
disp(['Fowlkes-Mallows Index: ' num2str(fowlkes_mallows_index)]);
disp(['Cohen Kappa: ' num2str(cohen_kappa)]);
disp(['G-Measure: ' num2str(g_measure)]);
disp(['Weighted Accuracy: ' num2str(weighted_accuracy)]);
disp(['Balanced Accuracy: ' num2str(balanced_accuracy)]);
disp(['Jaccard Index: ' num2str(jaccard_index)]);
disp(['Hamming Loss: ' num2str(hamming_loss)]);
disp(['Mutual Information: ' num2str(mutual_information)]);
disp(['Variation of Information: ' num2str(variation_of_information)]);
disp(['Goodman-Kruskal Lambda: ' num2str(goodman_kruskal_lambda)]);
