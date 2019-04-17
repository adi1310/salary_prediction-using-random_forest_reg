# Random Forest Regression

# Data Preprocessing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the Dataset
dataset = pd.read_csv('Position_Salaries.csv')
x = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# splitting the dataset into Training Set and Test Set
"""from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)"""

# Converting 1-D Array To Matrices
y = y.reshape(-1, 1)
 
# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_x=StandardScaler()
sc_y=StandardScaler()
x=sc_x.fit_transform(x)
y=sc_y.fit_transform(y)"""

# Fitting SVR to the Dataset
from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 300, random_state = 0)
regressor.fit(x, y)

# Predicting a new result
y_pred = regressor.predict([[6.5]])

# Used for higher resolution and smoother curve
x_grid = np.arange(min(x), max(x), 0.01)
x_grid = x_grid.reshape(len(x_grid), 1)

# Visualising the Random Forest Regression result with high resolution
plt.scatter(x, y, color = 'red')
plt.plot(x_grid, regressor.predict(x_grid), color = 'blue')
plt.title('Truth OR Bluff (Randoom Forest Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salaries')
plt.show()