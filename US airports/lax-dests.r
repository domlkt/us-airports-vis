# Load required libraries
library(usmap)
library(ggplot2)

# Define airport coordinates
airports <- data.frame(
    #airport = c("JFK", "LAX", "ORD", "ABC"),
    lat = c(
        33.64044444,
        30.19453278,
        42.3643475,
        39.85840806,
        32.89595056,
        40.69249722,
        29.98047222,
        40.63975111,
        33.94253611,
        28.42888889,
        25.79325,
        44.88054694,
        41.979595,
        45.58872222,
        33.43416667,
        47.44898194,
        37.61900194,
        37.36186194,
        40.78838778
    ), 
    lon = c(
        -84.42694444,
        -97.66987194,
        -71.00517917,
        -104.6670019,
        -97.0372,
        -74.16866056,
        -95.33972222,
        -73.77892556,
        -118.4080744,
        -81.31602778,
        -80.29055556,
        -93.2169225,
        -87.90446417,
        -122.5975,
        -112.0080556,
        -122.3093131,
        -122.3748433,
        -121.9290089,
        -111.9777731
    ) 
)

# Define the predetermined point (e.g., LAX)
predetermined_point <- data.frame(lat = 33.94253611, lon = -118.4080744)  # LAX coordinates

# Create the base map
us_map <- plot_usmap(include = "all") +
    labs(title = "") +
    theme(text = element_text(size = 16)) +
    theme(panel.border = element_blank())

# Add the outline explicitly
us_map <- us_map +
    geom_polygon(data = map_data("state"), aes(x = long, y = lat, group = group), fill = NA, color = "#232323", linewidth = 0.5)

# Add points for airports
us_map <- us_map +
    geom_point(data = airports, aes(x = lon, y = lat), color = "red", size = 3) +
    geom_text(data = airports, aes(x = lon, y = lat, label = ""), vjust = -1, color = "red", size = 3)

# Connect each airport to the predetermined point
us_map <- us_map +
    geom_segment(data = airports, aes(x = lon, y = lat, xend = predetermined_point$lon, yend = predetermined_point$lat), color = "blue", size = 0.5)

# Fix aspect ratio to prevent stretching and set limits to focus on the US
us_map <- us_map + coord_fixed(xlim = c(-129.5, -64.5), ylim = c(12, 50))

# Save the plot as a high-resolution PNG
png("lax-dests.png", width = 6000, height = 4000, res = 600)

# Print the map with airports highlighted
print(us_map)

# Close the PNG device (saves the file)
dev.off()
