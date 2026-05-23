# 🏥 Healthcare Risk Prediction Model & Web App

## 📌 Project Overview
This project is an end-to-end machine learning pipeline designed to predict the risk of patient complications based on hospital admission data. It bridges the gap between data processing, predictive modeling, and cloud deployment by featuring a trained **Logistic Regression** model hosted on a live, interactive web application.

**👉 [Click here to view the live app!]https://mukul-health-risk.streamlit.app/

---

## 🛠️ Technology Stack
* **Data Manipulation:** Python, Pandas
* **Machine Learning:** Scikit-Learn (Logistic Regression, ROC/AUC metrics)
* **Data Visualization:** Matplotlib
* **Model Serialization:** Joblib
* **Web Framework & Deployment:** Streamlit, GitHub, Streamlit Community Cloud

---

## 📂 Repository Structure
```text
├── app.py                   # The main Streamlit web application script
├── requirements.txt         # Dependencies required to run the app in the cloud
├── Risk_model.pkl           # The serialized/trained machine learning model
├── notebooks/               
│   └── risk_modlinghealthcare.ipynb  # Original Jupyter Notebook with all EDA & training code
├── data/                    
│   ├── patients.csv         # Sample dataset (if applicable)
│   ├── diagnoses.csv        # Sample dataset (if applicable)
│   └── outcomes.csv         # Sample dataset (if applicable)
└── README.md                # Project documentation
⚙️ Methodology & Step-by-Step Implementation
1. Data Processing & Feature Engineering
Data Integration: Merged primary patients data with external diagnoses and outcomes tables.

Datetime Calculation: Engineered a Length of Stay feature by calculating the difference between AdmissionDate and DischargeDate.

DType Resolution: Converted the resulting timedelta objects into raw integers using the Pandas .dt.days accessor so the machine learning model could process them.

Target Encoding: Mapped categorical outcomes into a binary numerical format (e.g., 'Recovered' = 0, 'Complicated'/'Deceased' = 1).

2. Model Training & Evaluation
Feature Selection: The model was trained on four key features: Age, Length of Stay, Treatment Cost, and Abnormal Lab Count.

Algorithm: Utilized Scikit-Learn's LogisticRegression to classify the risk level.

Evaluation: Evaluated model performance by calculating the False Positive Rate (FPR), True Positive Rate (TPR), and Area Under the Curve (AUC), and visualized the results using a custom Matplotlib ROC Curve.

3. Deployment
Exported the trained model from the Jupyter Notebook environment into a persistent Risk_model.pkl artifact using joblib.

Built an interactive frontend using Streamlit to collect user inputs and return real-time risk predictions and probability percentages.

Deployed the final application to the web using Streamlit Community Cloud linked to this GitHub repository.

💻 How to Run Locally
If you would like to run this project on your own machine, follow these steps:

Clone this repository to your local machine.

Navigate to the project folder in your terminal.

Install the required dependencies using:

Bash
pip install -r requirements.txt
Launch the Streamlit app:

Bash
streamlit run app.py
