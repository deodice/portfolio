# E-Commerce Shipping Analysis: Predicting On-Time Delivery Performance

[![Python](https://img.shields.io/badge/Python-3.12-blue)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0-green)](https://pandas.pydata.org/)
[![Scikit-learn](https://img.shields.io/badge/Scikit--learn-1.3-orange)](https://scikit-learn.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Exploratory Data Analysis and Machine Learning for Optimizing E-Commerce Logistics**

This project analyzes the [Customer Analytics Shipping Dataset](https://www.kaggle.com/datasets/prachi13/customer-analytics) to uncover factors driving late deliveries and build predictive models for proactive risk flagging.

**Live Notebook**: [View the full analysis (HTML render)](e-commerce-shipping-analysis_w_ML.html)  
**Date**: December 31, 2025  
**Author**: Derek Eodice, MBA, MSc

## Project Overview
E-commerce logistics face intense pressure for fast, reliable delivery. Even small delay increases lead to customer churn and operational costs.

This notebook combines:
- **Exploratory Data Analysis (EDA)**: Identify patterns in warehouses, shipment modes, product importance, discounts, and more.
- **Machine Learning**: Binary classification to predict late deliveries (AUC up to **0.74**).
- **Actionable Insights**: Recommendations for warehouse audits, priority routing, and predictive flagging.

**Key Business Impact**:
- Models can flag ~62% of late shipments pre-dispatch (StackingClassifier, F1=0.68).
- Potential 15-20% reduction in delays via targeted interventions.

## Key Findings
- High discounts and heavy products strongly predict delays.
- High-importance shipments underperform on timeliness despite priority status.
- Certain warehouses contribute disproportionately to late deliveries.
- Customer ratings weakly correlate with actual on-time performance.

## Machine Learning Highlights
- **Target**: Predict `Reached.on.Time_Y.N` (late vs. on-time).
- **Models Evaluated**: Logistic Regression, Random Forest, XGBoost, SVC, StackingClassifier.
- **Best Performance**:
  - XGBoost: ROC-AUC **0.738**
  - StackingClassifier: F1 **0.681** (best balance of precision/recall).
- **Visuals**: ROC curves, confusion matrices, classification reports.

## Technologies Used
- Python (Pandas, Matplotlib, Seaborn)
- Scikit-learn (pipelines, GridSearch, SMOTE for imbalance)
- XGBoost, Imbalanced-learn

## How to Run
1. Clone the repo: `git clone https://github.com/deodice/portfolio.git`
2. Navigate to project: `cd portfolio/e-commerce-shipping-analysis`
3. Install dependencies: `pip install pandas scikit-learn xgboost imbalanced-learn matplotlib seaborn`
4. Open notebook: `jupyter notebook e-commerce-shipping-analysis_w_ML.ipynb`

## Future Enhancements
- Add SHAP values for model interpretability.
- Incorporate real-time features (e.g., weather data).
- Deploy as a Streamlit app for interactive risk scoring.

## Portfolio Context
This is one of several projects in my data science portfolio. Check out the main repo for more: [deodice/portfolio](https://github.com/deodice/portfolio)

Feedback welcome! Feel free to open an issue or reach out.

---
*Built to demonstrate end-to-end DS skills: problem framing, EDA, modeling, and business translation.*
