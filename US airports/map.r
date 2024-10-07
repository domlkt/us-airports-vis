# Load required libraries
library(usmap)
library(ggplot2)

# Define airport coordinates with correct longitude for JFK
airports <- data.frame(
  airport = c("JFK", "LAX", "ORD"),
  lat = c(40.6413, 33.9416, 41.9742),      # Correct latitudes
  lon = c(-73.7781, -118.4085, -87.9073)   # Correct longitudes
)

# Create the map
us_map <- plot_usmap() +
  labs(title = "Map Highlighting JFK, LAX, and ORD Airports") +
  theme(text = element_text(size = 16)) +
  theme(panel.border = element_blank())  # Remove default border

# Create the thinner outline using map_data
state_data <- map_data("state")  # Get map data for states

# Add a custom outline with thinner lines
us_map <- us_map +
  geom_polygon(data = state_data, aes(x = long, y = lat, group = group), fill = NA, color = "black", linewidth = 0.5)  # Use linewidth instead of size

# Add points and labels for airports
us_map <- us_map +
  geom_point(data = airports, aes(x = lon, y = lat), color = "red", size = 3) +
  geom_text(data = airports, aes(x = lon, y = lat, label = airport), vjust = -1, color = "red", size = 4)

# Save the plot as a high-resolution PNG
png("us_airports_map.png", width = 6000, height = 4000, res = 900)  # Specify high resolution

# Print the map with airports highlighted
print(us_map)

# Close the PNG device (saves the file)
dev.off()
