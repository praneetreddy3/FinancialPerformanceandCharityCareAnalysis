import pandas as pd

# Define the file paths
input_file_path = r'C:\Users\HP\Downloads\CostReport_2021_Final.csv'
output_file_path = r'C:\Users\HP\Downloads\CostReportCleaned.csv'

# Read the CSV file
df = pd.read_csv(input_file_path)

# Define the facility types to delete
delete_types = ['CH', 'LTCH', 'RNMHC', 'ORD', '']

# Filter the dataframe to keep only the rows not in delete_types
df_cleaned = df[~df['CCN Facility Type'].isin(delete_types)]

# Save the cleaned dataset to a new CSV file
df_cleaned.to_csv(output_file_path, index=False)

print("Cleaned dataset saved as CostReportCleaned.csv")