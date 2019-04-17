# Random Forest Regression
# Data Preprocessing

# Importing the Dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into tne Training set and test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)


# Feature Scaling
# training_set[ ,2:3] = scale(training_set[ ,2:3])
# test_set[ ,2:3] = scale(test_set[ ,2:3])

# Fitting SVR to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)

# Predicting the new resulty_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Used for higher resolution and smoother curve
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

# Visualising the dataset result
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('salary vs Experience (Random Forest Regression Model)') +
  xlab('Years of Experience') + 
  ylab('salary')

