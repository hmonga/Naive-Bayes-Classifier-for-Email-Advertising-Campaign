train <- read_csv("training_email_advertising.csv")
test <- read_csv("test_email_advertising.csv")

train$purchased_previously <- as.factor(train$purchased_previously)
train$opened_previously <- as.factor(train$opened_previously)
train$test_var <- as.factor(train$test_var)
train$none_open_buy <- as.factor(train$none_open_buy)

test$purchased_previously <- as.factor(test$purchased_previously)
test$opened_previously <- as.factor(test$opened_previously)
test$test_var <- as.factor(test$test_var)
test$none_open_buy <- as.factor(test$none_open_buy)

nb_model <- naiveBayes(none_open_buy ~ purchased_previously + opened_previously + sales_12mo + test_var,
                       data = train)


train_preds <- predict(nb_model, newdata = train)

test_preds <- predict(nb_model, newdata = test)


confusion_train <- confusionMatrix(train_preds, train$none_open_buy)
print(confusion_train)

confusion_test <- confusionMatrix(test_preds, test$none_open_buy)
print(confusion_test)