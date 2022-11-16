# diurnals
## About
Input data frame to produce diurnal *hourly* trend. Consists of 3 functions
1. DiurnalAvg()
 -Parameters
  -df = DataFrame with data to get diurnal trend
  -TimeColumn = string, name of time column in data frame df
  -Purpose: Generate diurnal hourly *average*
2. DiurnalMed()
 -Parameters
  -df = DataFrame with data to get diurnal trend
  -TimeColumn = string, name of time column in data frame df
  -Purpose: Generate diurnal hourly *median*
3. char_to_time()
 -Purpose: convert string to as.POSIXct
 
 ## Installation
```
 devtools::install_github('bhoover59/diurnals
```

## Example Usage
```
newDataFrame <- DiurnalAvg(df = DataFrame, TimeColumn = "Time)
```
```
newDataFrame <- DiurnalMed(df = DataFrame, TimeColumn = "Time")
```
```
newDataFrame$Time <- char_to_time(df[,Time])
```

## Future Updates
1. Accept time already converted from string to as.POSIXct
2. More time options than 1 hour
  
