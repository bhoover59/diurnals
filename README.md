![Alt text](Users/bodehoover/Downloads/MOBCAT.png?raw=true "Title")
# About Me
Create diurnal trend for field campaign data. Functions automatically convert string times and characters.
## Installation
If you need to install devtools
```
install.packages("devtools")
```
```
library(devtools)
```
Installing diurnals package
```
devtools::install_github("bhoover59/diurnals")
```
Or if that doesn't work
```
remotes::install_github("bhoover59/diurnals")
```
To remove the package go to Packages in RStudio and hit X on right side. If that doesn't work, try this
```
remove.packages("diurnals")
```
Or if that doesn't work
```
unloadNamespace("diurnals")
```

## Diurnal
1. Inputs
   - df: data frame with field campaign data
   - TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   - diurnal average
   - diurnal median
   - standard deviation for each bin
   - count for each bin
   - ** DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count) **
```
diurnal <- Diurnal(df = df_name, TimeColumn = time_column_name)
```
## DiurnalAvg
1. Inputs
   - df: data frame with field campaign data
   - TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   - diurnal average
   - standard deviation for each bin
   - count for each bin
   - **DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count)**
```
diurnal_average <- DiurnalAvg(df = df_name, TimeColumn = time_column_name)
```
## DiurnalMed
1. Inputs
   - df: data frame with field campaign data
   - TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   - diurnal median
   - standard deviation for each bin
   - count for each bin
   - **DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count)**
```
diurnal_median <- DiurnalMed(df = df_name, TimeColumn = time_column_name)
```
## time_average
1. Inputs
   - df: data frame with field campaign data
   - interval: time step interval **in minutes** to average
   - TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   - averaged data frame by input in minutes
```
averaged_df <- time_average(df = df_name, interval = interval_minutes, TimeColumn = time_column_name)
```

## Future work:
   - Calculate standard error mean (SEM)
   - Bin size for time_average
