# Author: Emily Reidy
char_to_time <- function(TimeX){
  formats <- c(
    "%m/%d/%Y %H:%M:%S",    # e.g., 01/01/2023 12:00:00
    "%m/%d/%Y %I:%M:%S %p", # e.g., 01/01/2023 12:00:00 PM
    "%I/%d/%Y %I:%M:%S %p", # e.g., 01/01/2023 12:00:00 PM (updated format)
    "%Y-%m-%d %H:%M:%S",    # e.g., 2023-01-01 12:00:00
    "%m/%d/%Y %H:%M",       # e.g., 01/01/2023 12:00 (updated format)
    "%m/%d/%y %H:%M",       # e.g., 01/01/23 12:00
    "%m/%d/%Y",             # e.g., 01/01/2023
    "%Y-%m-%d"              # e.g., 2023-01-01
  )  #Add extra formats to character vector above
  #formats tested in order, so go from most specific to least specific,
  #as the first one that works will be used
  for (i in 1:length(formats)){
    test = as.POSIXct(TimeX, format = formats[i])
    if (length(na.omit(test)) == length(test)) {
      TimeX = as.POSIXct(TimeX, format = formats[i])
      break
    } else if (i == length(formats)){
      print("Could not find adequate format, char_to_time function needs to be edited")
    }
  }
  return(TimeX)
}
