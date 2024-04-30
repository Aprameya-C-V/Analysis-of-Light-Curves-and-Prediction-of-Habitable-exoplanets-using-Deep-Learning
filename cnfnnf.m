% Generate a sample confusion matrix (replace these values with your actual confusion matrix)
C = [1983 1; 53 0];

% Plot the confusion matrix
figure;
imagesc(C);
colormap(flipud(gray)); % Set color map to grayscale
textStrings = num2str(C(:), '%d');
textStrings = strtrim(cellstr(textStrings));
[x, y] = meshgrid(1:size(C, 1), 1:size(C, 2));
hStrings = text(x(:), y(:), textStrings(:), 'HorizontalAlignment', 'center');
midValue = mean(get(gca, 'CLim'));
textColors = repmat(C(:) > midValue, 1, 3);
set(hStrings, {'Color'}, num2cell(textColors, 2));
xlabel('Predicted Class');
ylabel('True Class');
set(gca, 'XTick', 1:size(C, 1), 'XTickLabel', {'Positive', 'Negative'}, 'YTick', 1:size(C, 2), 'YTickLabel', {'Positive', 'Negative'});
title('Confusion Matrix');
colorbar;
