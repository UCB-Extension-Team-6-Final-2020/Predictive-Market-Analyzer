### Description of preliminary data preprocessing
1. define the features set,
2. define the target set,
3. split into the training and testing sets,
4. create the StandardScaler instance, fit the scaler with the training set, and scale the data.

### Description of preliminary feature engineering and preliminary feature selection, inclduing decision making process
**Feature Selection** is a critical component in a Data Scientist’s workflow. When presented data with high dimensionality, 
1. *Training time* increases exponentially with number of features.
2. Models have increasing risk of *overfitting* with increasing number of features.<br>

For missing data, we have some options, such as Do nothing, Drop the row that has the missing value, or Fill in the row that has the missing value. In the Moduel, we use `dropna()` method to drop missing data, and `drop()` method to drop country column since only analyzing US at this point.

### Description of how data was split into training and testing data

A dataset is split into **training** and **testing** sets in machine learning. The model uses the training dataset (*75%*) to learn from it. It then uses the testing dataset (*25%*) to assess its performance. For example, <br>

`from sklearn.model_selection import train_test_split` <br>
`X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=1, stratify=y)` <br>

**Scikit-learn** `train_test_split` module takes X and y as arguments and splits each into `X_train`, `X_test`, `y_train`, and `y_test` sets.

### Explanation of model choice, including limitations and benefits

**Random forest** algorithm will sample the data and build several *smaller, and simpler* decision trees. Each tree is simpler because it is built from a random subset of features. Random forest algorithms are **beneficial** because they:
1. Are robust against overfitting as all of those weak learners are trained on different pieces of the data.
2. Can be used to **rank the importance** of input variables in a natural way.
3. Can handle thousands of input variables without variable deletion.
4. Are robust to outliers and nonlinear data.
5. Run efficiently on large datasets.
 
The main **limitation** of random forest is that a large number of trees can make the algorithm *too slow and ineffective* for real-time predictions. Random Forest creates a lot of trees and require much more time to train.

###	Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables)

###	Description of how they have trained the model thus far, and any additional training that will take place

###	Description of current accuracy score

