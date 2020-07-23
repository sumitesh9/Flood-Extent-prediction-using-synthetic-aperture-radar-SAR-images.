
# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


#importing the dataset
dataset = pd.read_csv("data.csv")
x = dataset.iloc[:,0:13].values
y = dataset.iloc[:,13:14].values

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(x, y, test_size = 0.3, random_state = 0)



#feature Scaling
from sklearn.preprocessing import StandardScaler
sc1 = StandardScaler()
X_train = sc1.fit_transform(X_train)
X_test = sc1.transform(X_test)



#fitting Random Forest Classifier to the dataset
from sklearn.ensemble import RandomForestClassifier
classifier = RandomForestClassifier(n_estimators = 10,criterion ='entropy',random_state = 0)# Create your classifier here
classifier.fit(X_train,y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)


#testing our model with random input
y_pred1 = classifier.predict(sc1.transform(np.array([[0.234397,0.034676148,	0.153502582,	0.259066487,	0.279471052,	0.068792674,	0.29431744,	0.17459758,	0.096445214,	0.536128317,	0.172761684,	0.477927145,	0.172761684]])))
int(np.ceil(y_pred1))

#testing our model with random input

y_pred2 = classifier.predict(sc1.transform(np.array([[0.421454009,	0.473529991,	0.473529991,	0.109887943,	0.092355483,	0.358094759,	0.100481048,	0.117159851,	0.054556319,	0.284406879,	0.171073992,	0.413100837,	0.307980058]
])))
int(np.ceil(y_pred2))