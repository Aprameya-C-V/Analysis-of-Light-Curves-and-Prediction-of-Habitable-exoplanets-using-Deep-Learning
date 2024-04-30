% Assuming you have arrays 'train_accuracy', 'test_accuracy', 'train_loss', and 'test_loss' containing the accuracy and loss values for each epoch

% Plotting accuracy curves
epochs = 1:length(train_accuracy);
figure;

subplot(2, 1, 1);
plot(epochs, train_accuracy, 'b-', 'LineWidth', 2);
hold on;
plot(epochs, test_accuracy, 'r--', 'LineWidth', 2);
xlabel('Epochs');
ylabel('Accuracy');
title('Training and Testing Accuracy Curves');
legend('Training Accuracy', 'Testing Accuracy');
grid on;

% Plotting loss curves
subplot(2, 1, 2);
plot(epochs, train_loss, 'b-', 'LineWidth', 2);
hold on;
plot(epochs, test_loss, 'r--', 'LineWidth', 2);
xlabel('Epochs');
ylabel('Loss');
title('Training and Testing Loss Curves');
legend('Training Loss', 'Testing Loss');
grid on;
