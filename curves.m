% Example data
yTrue = [1; 1; 0; 1; 0; 1; 0; 0; 1; 1];  % True labels
yScores = [0.8; 0.7; 0.4; 0.6; 0.3; 0.9; 0.2; 0.1; 0.85; 0.95];  % Predicted scores

% Sort predicted scores
[sortedScores, sortIdx] = sort(yScores);
sortedLabels = yTrue(sortIdx);

% Calculate proportion of positive samples
numSamples = numel(yTrue);
numPositive = cumsum(sortedLabels);
fractionPos = numPositive ./ (1:numSamples)';

% Plot calibration curve
figure;
plot(sortedScores, fractionPos);
xlabel('Predicted Score');
ylabel('Fraction of Positive Samples');
title('Calibration Curve');
