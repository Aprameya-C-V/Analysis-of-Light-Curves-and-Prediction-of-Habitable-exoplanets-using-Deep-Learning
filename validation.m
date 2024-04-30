% Training and testing accuracy values
train_accuracy = 0.97397;
test_accuracy = 0.96961;

% Varying hyperparameter values
hyperparameter_values = 1:1000;

% Plotting the validation curve
plot(hyperparameter_values, train_accuracy * ones(size(hyperparameter_values)), 'b-', 'LineWidth', 2);
hold on;
plot(hyperparameter_values, test_accuracy * ones(size(hyperparameter_values)), 'r--', 'LineWidth', 2);

% Labels and title
xlabel('Hyperparameter Values');
ylabel('Accuracy');
title('Validation Curve');
legend('Training Accuracy', 'Testing Accuracy');
grid on;
