% Sample data for training and validation accuracies
epochs = 1:500;
training_accuracy = linspace(0, 97.397, 500); % Training accuracy from 0 to 97.397% over 500 epochs
validation_accuracy = sin(linspace(0, pi, 500)) * 97.397; % Random validation accuracy for illustration

% Plotting the training and validation accuracies
figure;
plot(epochs, training_accuracy, 'b', 'LineWidth', 2);
hold on;
plot(epochs, validation_accuracy, 'r', 'LineWidth', 2);
hold off;

title('Training and Validation Accuracies');
xlabel('Epochs');
ylabel('Accuracy (%)');
legend('Training Accuracy', 'Validation Accuracy');
grid on;
