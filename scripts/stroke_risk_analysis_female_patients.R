# load necessary libraries
library(tidyverse)
library(readxl)

# Selecting my dataset from my computer
data <- read.csv("data/stroke.csv")

# checking first few rows of the data
head(data)

ggplot(data, aes(x = gender, fill = stroke)) +
  geom_bar(position = "fill", color = "black") +
  labs(title = "Gender vs Stroke", x = "Gender", y = "Proportion", fill = "Stroke") +
  scale_fill_manual(values = c("No" = "steelblue", "Yes" = "tomato")) +
  theme_minimal()


# C. filter dataset to include only female patients
female_data <- data %>% filter(gender == "Female")

#dropping patient ID for confidentiality
female_data$patient_id <- NULL


#checking that it is female data
head(female_data)

# handling missing values (which was bmi) (replacing them with median of the BMI column )
female_data$bmi <- ifelse(is.na(female_data$bmi), median(female_data$bmi, na.rm = TRUE), female_data$bmi)
#verifying that BMI imputation removed missing values
sum(is.na(female_data$bmi))

# converting all categorical variables into numerical variables (factors)
female_data$hypertension <- as.factor(female_data$hypertension)
female_data$heart_disease <- as.factor(female_data$heart_disease)
female_data$ever_married <- as.factor(female_data$ever_married)
female_data$work_type <- as.factor(female_data$work_type)
female_data$residence_type <- as.factor(female_data$Residence_type)
female_data$smoking_status <- as.factor(female_data$smoking_status)
female_data$stroke <- as.factor(female_data$stroke)

# checking structure of cleaned dataset
str(female_data)




# D. Data Analysis Part I: Descriptive Statistics to Analyze Data
library(ggplot2)

# Descriptive statistics for numerical variables
summary(female_data)
# Summary of statistics for numerical variables (age, avg_glucose_level, BMI)
summary(female_data %>% select(age, avg_glucose_level, bmi))

female_data$smoking_status <- factor(female_data$smoking_status, 
                                     levels = c("never smoked", "smokes", "unknown", "formerly smoked"))

ggplot(female_data, aes(x = smoking_status, fill = smoking_status)) +
  geom_bar() +
  scale_fill_manual(values = c("never smoked" = "skyblue", 
                               "smokes" = "gold", 
                               "unknown" = "gray", 
                               "formerly smoked" = "magenta")) +
  labs(title = "Smoking Status Distribution", 
       x = "Smoking Status", 
       y = "Count") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability


# Age Distribution with density curve
ggplot(female_data, aes(x = age)) +
  geom_histogram(aes(y = ..count..), bins = 20, fill = "skyblue", color = "darkblue", alpha = 0.8) +
  geom_density(aes(y = ..count..), color = "darkred", size = 1.5, linetype = "dashed") +
  labs(title = "Age Distribution (Female Patients)", x = "Age", y = "Frequency") +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )

# Hypertension vs Stroke (stacked bar chart with colors)
ggplot(female_data, aes(x = factor(hypertension), fill = factor(stroke))) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c("tomato", "steelblue"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Hypertension vs Stroke", y = "Proportion", x = "Hypertension (0 = No, 1 = Yes)", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )

# Heart Disease vs Stroke
ggplot(female_data, aes(x = factor(heart_disease), fill = factor(stroke))) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c("purple", "orange"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Heart Disease vs Stroke", y = "Proportion", x = "Heart Disease (0 = No, 1 = Yes)", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )

# Age Distribution vs Stroke (overlaid histogram)
ggplot(female_data, aes(x = age, fill = factor(stroke))) +
  geom_histogram(bins = 30, alpha = 0.6, position = "identity", color = "black") +
  scale_fill_manual(values = c("skyblue", "salmon"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Age Distribution vs Stroke", x = "Age", y = "Count", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )

# Marriage Status vs Stroke
ggplot(female_data, aes(x = factor(ever_married), fill = factor(stroke))) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c("pink", "red"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Marriage Status vs Stroke", y = "Proportion", x = "Ever Married (0 = No, 1 = Yes)", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )

# Work Type vs Stroke
ggplot(female_data, aes(x = work_type, fill = factor(stroke))) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c("skyblue", "darkgreen"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Work Type vs Stroke", y = "Proportion", x = "Work Type", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Residence Type vs Stroke
ggplot(female_data, aes(x = factor(residence_type), fill = factor(stroke))) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_manual(values = c("gray", "pink"), labels = c("No Stroke", "Stroke")) +
  labs(title = "Residence Type vs Stroke", y = "Proportion", x = "Residence Type (0 = Rural, 1 = Urban)", fill = "Stroke") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  )
# Stroke vs Smoking Status
ggplot(female_data, aes(x = smoking_status, fill = factor(stroke))) +
  geom_bar(position = "dodge") +
  labs(title = "Stroke vs Smoking Status", x = "Smoking Status", y = "Count", fill = "Stroke") +
  theme_minimal()

# Boxplot: Age by Stroke Status
ggplot(female_data, aes(x = factor(stroke), y = age, fill = factor(stroke))) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  scale_fill_manual(values = c("steelblue", "tomato")) +
  labs(title = "Age by Stroke Status", x = "Stroke (0 = No, 1 = Yes)", y = "Age") +
  theme_minimal()



head(data)
# Ensure gender and stroke are factors, getting ready to answer null hypothesis
data$gender <- as.factor(data$gender)  # Convert gender to factor
data$stroke <- as.factor(data$stroke)  # Convert stroke to factor

chi_sq <- chisq.test(table(data$gender, data$stroke))
chi_sq


# Create a contingency table for gender and stroke
contingency_table <- table(data$gender, data$stroke)

# Perform chi-square test to test the association between gender and stroke
chi_sq_test <- chisq.test(contingency_table)

# Display the chi-square test results
print(chi_sq_test)

# Interpretation of the p-value:
if(chi_sq_test$p.value < 0.05) {
  cat("Reject the null hypothesis. There is a statistically significant association between gender and stroke.\n")
} else {
  cat("Fail to reject the null hypothesis. There is no statistically significant association between gender and stroke.\n")
}

# Generate descriptive stats
describe(female_data)

# Frequency tables for categorical variables
table(female_data$smoking_status)
table(female_data$hypertension)
table(female_data$stroke)

# Contingency table for stroke and hypertension
table(female_data$hypertension, female_data$stroke)

# Proportion table
prop.table(table(female_data$hypertension, female_data$stroke))

chi_sq <- chisq.test(table(female_data$hypertension, female_data$stroke))
chi_sq

# T-test for continuous variables (e.g., age vs stroke)
t_test <- t.test(age ~ stroke, data = female_data)
t_test

# Logistic regression to test statistical relationship
logistic_model <- glm(stroke ~ hypertension + heart_disease + smoking_status + age + bmi + avg_glucose_level, 
                      data = female_data, family = "binomial")
summary(logistic_model)

# Mean and Median for numeric variables
mean_age <- mean(female_data$age, na.rm = TRUE)
median_age <- median(female_data$age, na.rm = TRUE)

# Mode function
mode_function <- function(x) {
  uniq <- unique(x)
  uniq[which.max(tabulate(match(x, uniq)))]
}

# Mode for smoking status
mode_smoking_status <- mode_function(female_data$smoking_status)

# Print results
cat("Mean Age:", mean_age, "\n")
cat("Median Age:", median_age, "\n")
cat("Mode of Smoking Status:", mode_smoking_status, "\n")

# Variance and Standard Deviation for age
variance_age <- var(female_data$age, na.rm = TRUE)
std_dev_age <- sd(female_data$age, na.rm = TRUE)

# Print results
cat("Variance of Age:", variance_age, "\n")
cat("Standard Deviation of Age:", std_dev_age, "\n")

#E. Data Analysis Part II: Inferential Statistics and Machine Learning
t_test <- t.test(age ~ stroke, data = female_data)
print(t_test)

# T-test: Compare age between stroke and non-stroke patients
t_test <- t.test(age ~ stroke, data = data)
cat("T-test p-value:", t_test$p.value, "\n")

# Chi-square test for categorical variables
chi_sq <- chisq.test(table(data$gender, data$stroke))
cat("Chi-square p-value:", chi_sq$p.value, "\n")


library(rpart)

# Build decision tree model
decision_tree <- rpart(stroke ~ hypertension + heart_disease + smoking_status + age + bmi + avg_glucose_level, 
                       data = female_data, method = "class")

# Display the tree
print(decision_tree)

# Plot the tree
plot(decision_tree)
text(decision_tree, use.n = TRUE)

library(e1071)

# Create Naive Bayes model
nb_model <- naiveBayes(stroke ~ hypertension + heart_disease + smoking_status + age + bmi + avg_glucose_level, 
                       data = female_data)

# View model summary
print(nb_model)

# Predict and check accuracy
nb_pred <- predict(nb_model, female_data)
table(nb_pred, female_data$stroke)


