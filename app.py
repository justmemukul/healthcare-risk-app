import streamlit as st
import pandas as pd
import joblib 

# 1. Load the correctly saved .pkl model file
model = joblib.load('Risk_model.pkl')

st.title("Healthcare Risk Predictor")

# 2. Collect all 4 required inputs
age = st.number_input("Age", min_value=0)
length_of_stay = st.number_input("Length of stay (days)", min_value=0)
treatment_cost = st.number_input("Treatment Cost", min_value=0.0)
abnormal_lab_count = st.number_input("Abnormal Lab Count", min_value=0) 

if st.button("Predict"):
    # 3. Build the DataFrame exactly as the model expects it
    input_data = pd.DataFrame(
        [[age, length_of_stay, treatment_cost, abnormal_lab_count]], 
        columns=["Age", "LengthOfStay", "TreatmentCost", "AbnormalLabCount"]
    )
    
    # 4. Make predictions
    prediction = model.predict(input_data)[0]
    probability = model.predict_proba(input_data)[0][1]

    # 5. Display results (Fixed formatting and capitalization)
    st.write(f'Risk prediction: {"High Risk" if prediction == 1 else "Low Risk"}')
    st.write(f"Risk probability: {round(probability, 2)}")