## Analysis Script

This folder contains the R script used to perform data preprocessing, statistical analysis, and machine learning modeling for the stroke risk analysis project.

### Script
- `stroke_risk_analysis_female_patients.R`

### Script Functionality
The script performs the following steps:
- Loads the stroke dataset from the `data/` directory
- Filters the data to include female patients only
- Handles missing values and variable transformations
- Conducts descriptive statistics and exploratory data analysis
- Performs inferential statistical testing (e.g., chi-square tests, t-tests)
- Trains and evaluates classification models, including:
  - Logistic regression
  - Decision tree
  - Naïve Bayes
- Computes model performance metrics and visualizations

### Running the Script
To run the analysis:
1. Ensure `stroke.csv` is located in the `data/` folder
2. Open the script in R or RStudio
3. Execute the script sequentially from top to bottom

The script is written to be reproducible and includes comments explaining each major analytical step.
