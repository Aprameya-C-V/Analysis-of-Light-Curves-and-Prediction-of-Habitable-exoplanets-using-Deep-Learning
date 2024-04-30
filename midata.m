% Generating synthetic data for machine learning
numSamples = 1000; % Number of samples
% Generating features
signalStrengths_mmWave = rand(numSamples, 1); % Example feature 1
interference_mmWave = rand(numSamples, 1); % Example feature 2
userPositionsX = rand(numSamples, 1); % Example feature 3
userPositionsY = rand(numSamples, 1); % Example feature 4

% Generating target variable (beamformingWeights)
% Example target variable generation (modify as needed)
% Here, a simple combination of features is used for illustration
beamformingWeights = 2 * signalStrengths_mmWave + 3 * interference_mmWave + userPositionsX - 0.5 * userPositionsY + randn(numSamples, 1);

% Creating a table with generated data
syntheticData_5G = table(signalStrengths_mmWave, interference_mmWave, userPositionsX, userPositionsY, beamformingWeights);
disp(head(syntheticData_5G));