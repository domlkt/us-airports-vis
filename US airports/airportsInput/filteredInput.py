import pandas as pd

# Load the data from a CSV file
data = pd.read_csv('airportsInput/usa-airports.csv', header=None)  # Adjust path as needed

# Assign column names for better readability
data.columns = ['IATA', 'Airport', 'City', 'State', 'Country', 'Latitude', 'Longitude']

# Filter out rows where State is 'AK' (Alaska) or 'PR' (Puerto Rico)
filtered_data = data[(data['State'] != 'AK') & (data['State'] != 'PR')]  # Keep rows where State is not 'AK' and not 'PR'

# Save the filtered data to a new CSV file
filtered_data.to_csv('filtered_airports.csv', index=False, header=False)