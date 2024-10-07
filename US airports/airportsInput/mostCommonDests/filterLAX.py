import pandas as pd

# Load the data from a CSV file
data = pd.read_csv('airportsInput/usa-airports.csv', header=None)  # Adjust path as needed

# Assign column names for better readability
data.columns = ['IATA', 'Airport', 'City', 'State', 'Country', 'Latitude', 'Longitude']

# Create a list of IATA codes to include
included_iata_codes = ['LAX', 'JFK', 'SFO', 'ORD', 'EWR', 'DFW', 'SEA', 'ATL', 'DEN', 'IAH', 'PHX', 'SLC', 'MIA', 'BOS', 'AUS', 'MCO', 'MSP', 'PDX', 'SJC']

# Filter data to include only rows where IATA is in the included list
filtered_data = data[data['IATA'].isin(included_iata_codes)]

# Save the filtered data to a new CSV file
filtered_data.to_csv('lax-dests.csv', index=False, header=False)
