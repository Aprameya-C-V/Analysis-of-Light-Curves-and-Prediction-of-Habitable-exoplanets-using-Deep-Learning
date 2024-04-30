% Confusion matrix values
conf_matrix = [1932, 300,0.97349; 300,300,0.98399];

% Visualizing the confusion matrix
labels = {'Habitable', 'Non-Habitable'};
figure;
heatmap(labels, labels, conf_matrix, 'Colormap', 'gray', 'ColorbarVisible', 'off', 'ShowAllTicks', true, 'FontSize', 10);
title('Confusion Matrix');
