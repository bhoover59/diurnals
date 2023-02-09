# About Me
Create diurnal trend for field campaign data
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

## Diurnal
1. Inputs
   -df: data frame with field campaign data
   -TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   -diurnal average
   -diurnal median
   -standard deviation for each bin
   -count for each bin
   -**DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count)**
```
diurnal <- Diurnal(df = df_name, TimeColumn = time_column_name)
```
## DiurnalAvg
1. Inputs
   -df: data frame with field campaign data
   -TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   -diurnal average
   -standard deviation for each bin
   -count for each bin
   -**DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count)**
```
diurnal_average <- DiurnalAvg(df = df_name, TimeColumn = time_column_name)
```
## DiurnalMed
1. Inputs
   -df: data frame with field campaign data
   -TimeColumn: name of column with times. Can be any string format. Edit char_to_time function if additional formats needed
2. Outputs:
   -diurnal median
   -standard deviation for each bin
   -count for each bin
   -**DOES NOT CALCULATE SEM but that can easily be done by SEM = sd / sqrt(count)**
```
diurnal_median <- DiurnalMed(df = df_name, TimeColumn = time_column_name)
```
