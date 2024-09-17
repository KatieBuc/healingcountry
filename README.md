# Healing Country

## Data Inputs

### CLIMATE

- **Filenames**:  
  - `LP_lismore_grid.txt`  
  - `PL_perth_grid.txt`  
  - `LP_tennant_grid.txt`
  
- **URL**: [Long Paddock Point Data](https://www.longpaddock.qld.gov.au/silo/point-data/)
  
- **Spatial resolution**: 0.05° x 0.05° (approx. 5.5 km north-south × 5 km east-west)  
- **Temporal resolution**: Daily  
- **Timespan**: 1889 - 2024  
- **Comments**: Interpolated data to avoid missingness and provide estimates closer to cities of interest.  
- **Data source used for AusEn**: Yes

**Columns**:
- `T.Max` (°C; Maximum temperature)
- `T.Min` (°C; Minimum temperature)
- `Rain` (mm; Rainfall)
- `Evap` (mm; Evaporation)
- `Radn` (MJ/m²; Radiation)
- `VP` (hPa; Vapour Pressure)
- `RHmaxT` (%; Estimated Relative Humidity at Temperature T.Max)
- `RHminT` (%; Estimated Relative Humidity at Temperature T.Min)

---

### ATMOSPHERE

- **Filename**:  
  - `air_quality_processed.rds`
  
- **URL**: [CAMS Global Reanalysis](https://ads.atmosphere.copernicus.eu/cdsapp#!/dataset/cams-global-reanalysis-eac4?tab=form)
  
- **Spatial resolution**: 0.75° x 0.75° (approx. 83.5 km north-south × 75.5 km east-west)  
- **Temporal resolution**: Daily (selected time as 00:00 UTC, 3-hourly data available)  
- **Timespan**: 2003 - 2023  
- **Comments**: Original files too large for GitHub, locations extracted to reduce size. Original data requested within Restricted Area: North -10, South -44, West 112, East 154. API ceases use in Sept 2024.  
- **Data source used for AusEn**: Yes

**Columns**:
- `pm1` (Particulate matter d < 1 µm)
- `pm25` (Particulate matter d < 2.5 µm)
- `pm10` (Particulate matter d < 10 µm)
- `CO` (Total column carbon monoxide)
- `NO2` (Total column nitrogen dioxide)
- `NO` (Total column nitrogen monoxide)
- `O3` (Total column ozone)

---

### DEMOGRAPHIC

- **Filenames**:  
  - `abs_population_sa.xlsx`  
  - `abs_population_lga.xlsx`
  
- **URL**: [ABS Population Data](https://www.abs.gov.au/statistics/people/population/regional-population/2022-23#data-downloads)
  
- **Spatial resolution**: SA2-4, LGA  
- **Temporal resolution**: Yearly  
- **Timespan**: 2001 - 2023  
- **Comments**:  
  - `abs_population_sa.xlsx`: Population estimates by SA2 and above  
  - `abs_population_lga.xlsx`: Population estimates by LGA, Significant Urban Area, Remoteness Area, and Electoral Division  
  - Need to incorporate shapefiles to map this data.  
- **Data source used for AusEn**: Yes
