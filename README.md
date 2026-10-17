# Student Performance & Placement Analytics

## 1. Project Overview

Student Performance & Placement Analytics is an end-to-end data analytics and machine learning project designed to explore the relationship between students' academic performance, technical skills, placement preparation, and placement outcomes.

The project uses Python for data analysis and machine learning, SQL for structured data analysis, and Power BI to create an interactive dashboard.

**Note:** This project uses a synthetic educational dataset created for demonstration and learning purposes. It does not contain real student placement records.

## 2. Project Objectives

* Analyze student academic performance and skill levels.
* Calculate overall placement rates and compare placement outcomes across departments.
* Explore relationships between internships, projects, certifications, mock interviews, and placement status.
* Analyze salary package patterns among placed students.
* Build and evaluate machine learning models for placement-status prediction.
* Present key findings through an interactive Power BI dashboard.

## 3. Technologies Used

* **Python:** Data analysis and machine learning.
* **Pandas and NumPy:** Data manipulation and numerical analysis.
* **Matplotlib:** Data visualization.
* **Scikit-learn:** Data preprocessing, model training, and evaluation.
* **SQL and SQLite:** Structured queries and database analysis.
* **Power BI:** Interactive dashboards and reporting.
* **Jupyter Notebook:** Development and documentation of the analysis.

## 4. Dataset Description

The dataset contains 1,000 synthetic student records and 24 columns covering academic performance, technical skills, placement preparation, placement status, and salary packages.

Key attributes include:

* Academic performance: 10th percentage, 12th percentage, and CGPA.
* Skills: coding, communication, technical skills, and aptitude.
* Preparation: internships, projects, certifications, hackathons, preparation hours, and mock interviews.
* Placement outcomes: placement status, interview score, and package in lakhs per annum (LPA).

The dataset is intended for educational analysis. Findings should not be interpreted as verified patterns in real-world recruitment.

## 5. Exploratory Data Analysis

The Python analysis examines dataset quality, placement distribution, academic performance, skills, preparation activities, and package trends.

Selected findings from the synthetic dataset:

* Total students: 1,000.
* Overall placement rate: 40%.
* Average CGPA: approximately 7.60.
* Average package among placed students: approximately 11.30 LPA.
* Placement rates varied across departments and preparation-related categories.

The analysis also compares placement outcomes by internships, projects, certifications, mock interviews, and placement-preparation hours.

These are descriptive results from synthetic data, not evidence that any individual factor causes placement success.

## 6. SQL Analysis

SQLite stores the dataset in a table named `student_performance`.

The SQL analysis includes queries for:

* Overall placement statistics.
* Placement rates by department.
* Academic performance comparisons.
* Placement outcomes by internships and projects.
* Backlog and certification analysis.
* Preparation-hour and mock-interview comparisons.
* Average package analysis among placed students.

The SQL scripts are available in the `sql/` directory.

## 7. Power BI Dashboard

The Power BI report contains four pages:

1. **Executive Overview:** Key performance indicators and an overview of placement outcomes.
2. **Placement Insights:** Placement-rate comparisons across preparation and academic categories.
3. **Academic & Skills Analysis:** Comparisons of CGPA, attendance, and skill scores by placement status.
4. **Package Analysis:** Package comparisons across departments and selected student attributes.

The dashboard supports interactive exploration of the synthetic dataset.

## 8. Machine Learning

Two classification algorithms were trained to predict placement status:

* Logistic Regression.
* Random Forest Classifier.

### Model Evaluation

The models were evaluated on a held-out test set containing 200 records.

| Metric               | Logistic Regression | Random Forest |
| -------------------- | ------------------: | ------------: |
| Accuracy             |              82.00% |        77.00% |
| Precision for Placed |              81.43% |        72.37% |
| Recall for Placed    |              71.25% |        68.75% |
| F1-score for Placed  |              76.00% |        70.51% |

Logistic Regression performed better than Random Forest on these test-set metrics. These results apply only to this synthetic dataset and do not demonstrate expected performance on real student records.

### Feature Importance

The Random Forest feature-importance analysis ranked placement-preparation hours as the most important individual feature, followed by coding skill, CGPA, 12th percentage, and interview score.

Feature importance describes the model's use of variables; it does not establish causation.

## 9. Project Structure

```text
student-performance-placement-analytics/
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── student_placement.db
├── notebooks/
│   ├── 01_data_generation.ipynb
│   └── 02_placement_prediction.ipynb
├── sql/
│   └── placement_analysis.sql
├── visualizations/
│   └── feature_importance.png
├── dashboard/
│   └── Student_Performance_Placement_Analytics.pbix
├── models/
│   └── placement_prediction_model.joblib
└── README.md

Adjust notebook or file names in this structure if they differ in your actual project.

10. How to Run the Project
Prerequisites

Install Python and create a virtual environment. The project was developed using Python 3.13.

Setup

Open a terminal in the project directory and run:

python -m venv .venv

Activate the virtual environment in Windows PowerShell:

.\.venv\Scripts\Activate.ps1

Install the required packages:

pip install pandas numpy matplotlib scikit-learn jupyter openpyxl joblib

Open Jupyter Notebook or VS Code and run the notebooks in order, beginning with the exploratory data analysis notebook and then the placement prediction notebook.

Use the SQL script in the sql/ directory to inspect and analyze the SQLite database.

Open the .pbix file in Power BI Desktop to explore the dashboard.

11. Limitations
The dataset is synthetic and may not represent real student populations or recruitment practices.
Model performance on synthetic records cannot be assumed to generalize to real students.
Relationships identified by exploratory analysis do not prove causation.
The models are educational demonstrations and should not be used to make actual recruitment decisions.
12. Conclusion

This project demonstrates an end-to-end workflow involving data cleaning, exploratory data analysis, SQL queries, Power BI dashboard development, and machine learning classification.

It provides practical experience in combining data analysis, visualization, and predictive modeling into a single portfolio project.