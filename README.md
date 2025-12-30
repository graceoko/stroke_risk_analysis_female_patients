# Stroke Risk Analysis in Female Patients Using Statistical Modeling and Machine Learning

## Overview
This project analyzes demographic and health-related factors associated with stroke occurrence in female patients, with a particular focus on hypertension and smoking status. Using a structured healthcare dataset, the analysis combines descriptive statistics, inferential methods, and machine learning models implemented in R to explore stroke risk patterns and predictive signals.

Rather than treating stroke prediction as a purely algorithmic task, this project emphasizes interpretability, hypothesis testing, and healthcare-relevant trade-offs, particularly in understanding risk factors within a gender-specific population.

---

## Dataset
The analysis uses a publicly available stroke dataset containing demographic and clinical variables related to stroke risk.

Key variables include:
- Age
- Hypertension status
- Heart disease
- Average glucose level
- Body mass index (BMI)
- Smoking status
- Marital status, work type, and residence type
- Stroke occurrence (binary outcome)

For modeling purposes, the dataset was filtered to include **female patients only**, enabling focused analysis of stroke risk factors within this population.

---

## Analytical Objectives
This project addressed two primary objectives:

1. **Statistical Analysis:**  
   Evaluate the relationship between health indicators (e.g., hypertension, glucose levels, smoking) and stroke occurrence in female patients using descriptive and inferential statistics.

2. **Predictive Modeling:**  
   Develop and evaluate machine learning models to predict stroke occurrence in female patients based on demographic and health-related features.

---

## Methods

### Data Preparation
- Missing BMI values were imputed using the median
- Categorical variables were converted to factors
- Confidential identifiers were removed
- Data integrity and structure were verified prior to analysis

### Statistical Analysis
- Descriptive statistics summarized age, BMI, and glucose levels
- Chi-square testing assessed associations between categorical variables
- Logistic regression was used to evaluate the influence of key risk factors on stroke likelihood

### Machine Learning Models
The following classification models were implemented in R:
- Logistic Regression
- Decision Tree
- Naïve Bayes

Model performance was evaluated using:
- Accuracy
- Precision
- Recall
- F1 score
- ROC and AUC
- Cross-validation

---

## Key Findings
- **Hypertension and smoking status** emerged as the strongest predictors of stroke occurrence in female patients
- Age showed a significant positive association with stroke risk
- Logistic regression and decision tree models highlighted clinically interpretable risk factors
- Gender itself was not a statistically significant predictor once the dataset was restricted to female patients, though interactions with other factors may warrant further study

These findings reinforce the importance of targeted risk assessment strategies for stroke prevention in women.

---

## Why This Matters
Stroke risk models often underrepresent or oversimplify gender-specific factors. This project demonstrates how combining statistical inference with machine learning can provide clearer insight into stroke risk drivers for female patients, supporting more informed prevention and early intervention strategies.

---

## Limitations
- Class imbalance in stroke occurrence
- Limited feature set
- Absence of genetic or longitudinal data
- Results may not generalize beyond the studied population

---

## Future Work
- Explore interaction effects between risk factors
- Apply cost-sensitive or recall-optimized models
- Incorporate additional behavioral or longitudinal variables
- Extend analysis to compare male and female populations

---

## Artifacts
- **R Script:** Data cleaning, statistical analysis, and machine learning models
- **Technical Report:** Extended analysis with detailed methodology and references
