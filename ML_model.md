### Description of preliminary data preprocessing

### Description of preliminary feature engineering and preliminary feature selection, inclduing decision making process

### Description of how data was split into training and testing data

A dataset is split into **training** and **testing** sets in machine learning. The model uses the training dataset (*75%*) to learn from it. It then uses the testing dataset (*25%*) to assess its performance. For example, <br>

`from sklearn.model_selection import train_test_split` <br>
`X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=1, stratify=y)` <br>

**Scikit-learn** `train_test_split` module takes X and y as arguments and splits each into `X_train`, `X_test`, `y_train`, and `y_test` sets.

### Explanation of model choice, including limitations and benefits
