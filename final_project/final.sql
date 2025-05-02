CREATE SCHEMA IF NOT EXISTS final302;
USE final302;

CREATE TABLE IF NOT EXISTS algorithm (
	base_ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    type VARCHAR(50) NOT NULL,
    CHECK (type IN ('Supervised', 'Unsupervised'))
);
CREATE TABLE IF NOT EXISTS dataset (
	data_ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
CREATE TABLE IF NOT EXISTS model (
	model_ID INT AUTO_INCREMENT PRIMARY KEY,
    base_ID INT NOT NULL,
    data_ID INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    version VARCHAR(10) NOT NULL,
    description TEXT,
    accuracy DECIMAL(5,3) NOT NULL,
    is_active BOOLEAN NOT NULL, 
    CHECK (accuracy BETWEEN 60 AND 100),
    FOREIGN KEY (base_ID) REFERENCES algorithm(base_ID),
    FOREIGN KEY (data_ID) REFERENCES dataset(data_ID)
);
CREATE TABLE IF NOT EXISTS performance_log (
	log_ID INT AUTO_INCREMENT PRIMARY KEY,
    model_ID INT NOT NULL,
    FOREIGN KEY (model_ID) REFERENCES model(model_ID)
);
CREATE TABLE IF NOT EXISTS hyperparameter (
	log_ID INT,
    name VARCHAR(50) NOT NULL,
    value VARCHAR(50) NOT NULL,
    PRIMARY KEY (log_ID, name),
    FOREIGN KEY (log_ID) REFERENCES performance_log(log_ID)
);
CREATE TABLE IF NOT EXISTS metric (
	log_ID INT,
    name VARCHAR(50) NOT NULL,
    value VARCHAR(50) NOT NULL,
    PRIMARY KEY (log_ID, name),
    FOREIGN KEY (log_ID) REFERENCES performance_log(log_ID)
);

# Insert statements
INSERT INTO algorithm (name, description, type) VALUES
('Random Forest Classifier', 'Ensemble learning method using decision trees', 'Supervised'),
('K-Means', 'Unsupervised clustering algorithm', 'Unsupervised'),
('XGBoost', 'Gradient boosting framework (XGBClassifier)', 'Supervised'),
('Gaussian MM', 'Gaussian Mixture Model for clustering', 'Unsupervised'),
('Logistic Regression', 'Linear model for binary classification', 'Supervised'),
('SVM', 'Support Vector Machine (SVC)', 'Supervised'),
('KNN', 'K-Nearest Neighbors classifier', 'Supervised'),
('DBSCAN', 'Density-Based Spatial Clustering', 'Unsupervised'),
('Naive Bayes', 'Probabilistic classifier using Bayes theorem (BernoulliNB)', 'Supervised'),
('Linear Regression', 'Predicts target variable using linear equation', 'Supervised'),
('Gradient Boosting Regressor', 'Ensemble method for regression tasks', 'Supervised');

INSERT INTO dataset (name, description) VALUES
('MNIST', 'Handwritten digit images dataset'),
('Iris', 'Flower classification dataset'),
('CIFAR-10', '10-class image classification dataset'),
('Seoul Weather', 'Temporal and weather data dataset for Seoul, South Korea'),
('Titanic', 'Survival classification dataset'),
('Fashion MNIST', 'Images of clothing items for classification'),
('Breast Cancer', 'Wisconsin Diagnostic Breast Cancer dataset'),
('House Prices', 'Regression dataset predicting house prices'),
('Bike Sharing', 'Dataset to predict bike rental counts');

INSERT INTO model (base_ID, data_ID, name, version, description, accuracy, is_active) VALUES
(1, 1, 'RF-MNIST', '1.0', 'Random Forest on MNIST', 96.80, TRUE),
(2, 2, 'KM-Iris', '1.1', 'KMeans on Iris', 88.92, FALSE),
(3, 3, 'XGB-CIFAR10', '2.0', 'XGBoost on CIFAR-10', 83.23, TRUE),
(4, 4, 'GMM-Weather', '1.0', 'Gaussian MM on Seoul Weather', 80.15, TRUE),
(5, 2, 'LogReg-Iris', '2.1', 'LogReg on Iris with enhancements', 92.28, TRUE),
(6, 5, 'SVM-Titanic', '1.0', 'SVM on Titanic dataset', 81.20, TRUE),
(7, 6, 'KNN-Fashion', '1.1', 'KNN classifier on Fashion MNIST', 87.60, TRUE),
(8, 2, 'DBSCAN-Iris', '1.0', 'DBSCAN applied to Iris', 76.40, FALSE),
(9, 7, 'NB-Cancer', '1.2', 'Naive Bayes for cancer classification', 91.07, TRUE),
(10, 8, 'LR-HousePrices', '1.0', 'Linear Regression on House Prices', 84.25, TRUE),
(11, 9, 'GBR-BikeSharing', '1.0', 'Gradient Boosting on Bike Sharing', 89.50, TRUE);

INSERT INTO performance_log (model_ID) VALUES (1), (3), (4), (5), (2), (1), (3), (5), (4), (6), (8), (9), (10), (11);

INSERT INTO hyperparameter (log_ID, name, value) VALUES
(1, 'n_estimators', '100'),
(1, 'max_depth', '10'),
(2, 'n_estimators', '50'),
(3, 'n_components', '5'),
(3, 'init_params', 'kmeans'),
(4, 'solver', 'lbfgs'),
(5, 'n_clusters', '3'),
(5, 'init', 'k-means++'),
(6, 'n_estimators', '150'),
(6, 'max_features', 'sqrt'),
(7, 'learning_rate', '0.05'),
(7, 'gamma', '0.1'),
(8, 'penalty', 'l2'),
(8, 'C', '1.0'),
(9, 'l1_ratio', '0.6'),
(10, 'kernel', 'rbf'),
(10, 'C', '1.0'),
(11, 'eps', '0.5'),
(11, 'algorithm', 'auto'),
(12, 'alpha', '0.5'),
(13, 'fit_intercept', 'true'),
(14, 'n_estimators', '200'),
(14, 'learning_rate', '0.1');

INSERT INTO metric (log_ID, name, value) VALUES
(1, 'f1_score', '96.2'),
(1, 'precision', '95.8'),
(2, 'auc', '79.4'),
(2, 'log_loss', '0.643'),
(3, 'silhouette_score', '0.688'),
(3, 'calinski_harabasz', '1210.90'),
(4, 'accuracy', '92.28'),
(4, 'recall', '89.10'),
(5, 'silhouette_score', '0.889'),
(5, 'inertia', '128.7'),
(6, 'f1_score', '96.8'),
(6, 'recall', '97.1'),
(7, 'auc', '83.2'),
(7, 'log_loss', '0.482'),
(8, 'accuracy', '92.1'),
(8, 'precision', '91.8'),
(9, 'silhouette_score', '0.8015'),
(9, 'calinski_harabasz', '3651.65'),
(10, 'accuracy', '81.2'),
(10, 'recall', '79.3'),
(11, 'silhouette_score', '0.764'),
(12, 'auc', '91.0'),
(12, 'precision', '90.5'),
(13, 'rmse', '21345.6'),
(13, 'mae', '15876.4'),
(14, 'rmse', '17532.2'),
(14, 'mae', '13200.9');

# Queries

## Highest Accuracy Models
-- All models sorted by accuracy
SELECT name, accuracy, is_active
	FROM model
	ORDER BY accuracy DESC;
-- Get number of logs for the top performing model
SELECT m.name, COUNT(p.log_ID) AS log_count
	FROM model m
	LEFT JOIN performance_log p ON m.model_ID = p.model_ID
	WHERE m.name = (SELECT name FROM model WHERE accuracy = (SELECT MAX(accuracy) FROM model));
-- Get the models above the average accuracy
SELECT name, accuracy
	FROM model
	WHERE accuracy > (SELECT AVG(accuracy) FROM model)
	ORDER BY accuracy DESC;
-- Get the models above the average accuracy that are active
SELECT name, accuracy
	FROM model
	WHERE accuracy > (SELECT AVG(accuracy) FROM model) 
	AND is_active = TRUE
	ORDER BY accuracy DESC;

## Supervised vs Unsupervised Learning Models
-- Count supervised vs unsupervised models
SELECT a.type AS algorithm_type, COUNT(m.model_ID) AS num_models
	FROM algorithm a
	JOIN model m ON a.base_ID = m.base_ID
	GROUP BY algorithm_type
	ORDER BY num_models DESC;
-- All model's name and algorithm type
SELECT m.name AS model_name, m.accuracy AS model_accuracy, a.type AS model_type
	FROM model m
	JOIN algorithm a ON m.base_ID = a.base_ID
	ORDER BY model_type, model_accuracy;
-- Average accuracy for type of algorithm
SELECT a.type AS algorithm_type, AVG(m.accuracy) AS avg_accuracy
	FROM algorithm a
	JOIN model m ON a.base_ID = m.base_ID
	GROUP BY algorithm_type
	ORDER BY avg_accuracy DESC;
-- Average accuracy for type of algorithm (excluding inactive models)
SELECT a.type AS algorithm_type, AVG(m.accuracy) AS avg_accuracy
	FROM algorithm a
	JOIN model m ON a.base_ID = m.base_ID
	WHERE m.is_active = TRUE
	GROUP BY algorithm_type
	ORDER BY avg_accuracy DESC;

## Dataset Comparison
-- Count models per dataset
SELECT d.name AS dataset_name, COUNT(m.model_ID) AS model_count
	FROM dataset d
	JOIN model m ON d.data_ID = m.data_ID
	GROUP BY dataset_name
	ORDER BY model_count DESC;
-- Get models for top used dataset
SELECT m.name AS model_name, d.name AS dataset_name, m.accuracy
	FROM model m
	JOIN dataset d ON m.data_ID = d.data_ID
	WHERE m.data_ID = (SELECT data_ID FROM model GROUP BY data_ID ORDER BY COUNT(*) DESC LIMIT 1)
	ORDER BY accuracy DESC;
-- Get models for top used dataset (excluding inacitve models)
SELECT m.name AS model_name, d.name AS dataset_name, m.accuracy
	FROM model m
	JOIN dataset d ON m.data_ID = d.data_ID
	WHERE m.data_ID = (SELECT data_ID FROM model GROUP BY data_ID ORDER BY COUNT(*) DESC LIMIT 1)
	AND m.is_active = TRUE
	ORDER BY accuracy DESC;
-- Avg model accuracy for each dataset
SELECT d.name AS dataset, AVG(m.accuracy) AS avg_accuracy
	FROM model m
	JOIN dataset d ON m.data_ID = d.data_ID
	GROUP BY d.name
	ORDER BY avg_accuracy DESC;
-- Avg model accuracy for each dataset (excluding inactive models)
SELECT d.name AS dataset, AVG(m.accuracy) AS avg_accuracy
	FROM model m
	JOIN dataset d ON m.data_ID = d.data_ID
	WHERE m.is_active = TRUE
	GROUP BY d.name
	ORDER BY avg_accuracy DESC;

## Logs
-- All models without logs
SELECT m.name, (SELECT AVG(accuracy) FROM model) - m.accuracy as mean_deviation
	FROM model m
	LEFT JOIN performance_log p ON m.model_ID = p.model_ID
	WHERE p.log_ID IS NULL;
-- Classifying supervised models
SELECT DISTINCT m.name AS model_name, a.name AS algorithm, m.accuracy,
	CASE
		WHEN me.name IN ('f1_score', 'accuracy', 'precision', 'recall') THEN 'Classification'
		WHEN me.name IN ('rmse', 'mae') THEN 'Regression'
	END AS model_type
	FROM model m
	JOIN algorithm a ON m.base_ID = a.base_ID
	JOIN performance_log pl ON m.model_ID = pl.model_ID
	JOIN metric me ON pl.log_ID = me.log_ID
	WHERE me.name IN ('f1_score', 'accuracy', 'precision', 'recall', 'rmse', 'mae') AND m.is_active = TRUE;
-- Averaging the classified supervised models
SELECT model_type, AVG(model_accuracy) AS avg_accuracy
	FROM (SELECT m.model_ID, m.accuracy AS model_accuracy,
	CASE
		WHEN me.name IN ('f1_score', 'accuracy', 'precision', 'recall') THEN 'Classification'
		WHEN me.name IN ('rmse', 'mae') THEN 'Regression'
	END AS model_type
    FROM model m
    JOIN performance_log pl ON m.model_ID = pl.model_ID
    JOIN metric me ON pl.log_ID = me.log_ID
    WHERE me.name IN ('f1_score', 'accuracy', 'precision', 'recall', 'rmse', 'mae') AND m.is_active = TRUE
    GROUP BY m.model_ID, m.accuracy, model_type
	) AS typed_models
	GROUP BY model_type;