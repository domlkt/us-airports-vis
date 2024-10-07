import pandas as pd

# Load the weather data from the CSV file
weather_data = pd.read_csv('lax-dests.csv')

# Select the latitude column and add a comma to each entry without quotes
filtered_latitude = weather_data[['latitude']].copy()  # Use .copy() to avoid SettingWithCopyWarning
filtered_latitude['latitude'] = filtered_latitude['latitude'].astype(str) + ','

# Save the latitude data to a new CSV file without extra characters
with open('airportsInput/lat.csv', 'w') as f:
    for latitude in filtered_latitude['latitude']:
        f.write(latitude + '\n')  # Write each latitude on a new line

# Select the longitude column and add a comma to each entry without quotes
filtered_longitude = weather_data[['longitude']].copy()  # Use .copy() to avoid SettingWithCopyWarning
filtered_longitude['longitude'] = filtered_longitude['longitude'].astype(str) + ','

# Save the longitude data to a new CSV file without extra characters
with open('airportsInput/long.csv', 'w') as f:
    for longitude in filtered_longitude['longitude']:
        f.write(longitude + '\n')  # Write each longitude on a new line
