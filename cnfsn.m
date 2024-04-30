% Define the confusion matrix
confusionMatrix = [1983, 326; 123, 386];

% Calculate percentages
totalSamples = sum(confusionMatrix(:));
accuracyPercentage = 100 * (confusionMatrix(1,1) + confusionMatrix(2,2)) / totalSamples;
errorPercentage = 100 * (confusionMatrix(1,2) + confusionMatrix(2,1)) / totalSamples;

% Calculate percentages within confusion matrix
confusionMatrixPercent = 100 * confusionMatrix / totalSamples;

% Relabel classes
classNames = {'Habitable', 'Non-Habitable'};

% Plot the confusion matrix with percentages
figure;
imagesc(confusionMatrixPercent);
colormap(parula);
colorbar;

% Display percentages within cells
for i = 1:size(confusionMatrix, 1)
    for j = 1:size(confusionMatrix, 2)
        text(j, i, sprintf('%0.1f%%', confusionMatrixPercent(i,j)), 'HorizontalAlignment', 'center');
    end
end

xticklabels(classNames);
yticklabels(classNames);
xlabel('Predicted');
ylabel('Actual');
title('Confusion Matrix with Percentages');

% Display accuracy and error percentages
disp(['Accuracy: ', num2str(accuracyPercentage), '%']);
disp(['Error Rate: ', num2str(errorPercentage), '%']);
