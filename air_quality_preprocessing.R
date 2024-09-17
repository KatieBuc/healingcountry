library(terra)
library(geosphere)
library(dplyr)
library(tidyr)
library(data.table)

vars = c("pm1", "pm25", "pm10", "NO", "NO2", "CO", "O3")

name_mapping <- c(
  "lismore" = "Lismore",
  "perth" = "Perth",
  "tennant" = "Tennant Creek"
)

latlong_mapping <- list(
  "lismore" = c(-28.8094, 153.2879),
  "perth" = c(-31.9514, 115.8617),
  "tennant" = c(-19.6459, 134.1910)
)

find_grid_containing_point <- function(df, lat, lon, grid_size = 0.75) {
  # Filter for grid points where the given lat/lon would fall within the grid cell
  containing_grid <- df %>%
    dplyr::filter(
      x <= lon & lon < (x + grid_size),
      y <= lat & lat < (y + grid_size)  
    )
  
  return(containing_grid)
}

all_data <- data.frame()

for (var in vars) {
  merged_data <- rast(paste0("./Data/cams_", var, ".grib"))
  df <- as.data.frame(merged_data, xy = TRUE)
  colnames(df)[3:ncol(df)] <- as.character(time(merged_data))
  df$variable <- var
  
  # Filter for the three locations (Lismore, Perth, Tennant Creek)
  filtered_data <- do.call(rbind, lapply(names(latlong_mapping), function(location) {
    coords <- latlong_mapping[[location]]
    grid_cell <- find_grid_containing_point(df, coords[1], coords[2])
    grid_cell$location <- name_mapping[[location]]
    return(grid_cell)
  }))
  all_data <- rbind(all_data, filtered_data)
}

# Convert data.frame to data.table
dt <- as.data.table(all_data)

# Pivot the table using melt
pivoted_dt <- melt(
  dt, 
  id.vars = c("x", "y", "location", "variable"),
  variable.name = "date", 
  value.name = "value"    
)

# Print the pivoted data table
print(pivoted_dt)
saveRDS(pivoted_dt, "./Data/air_quality_processed.rds")