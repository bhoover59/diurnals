# Author: Emily Reidy
char_to_time <- function(TimeX){
  formats = c("%m/%d/%Y %H:%M:%S", "%m/%d/%Y %I:%M:%S %p", "%Y-%m-%d %H:%M:%S", "%m/%d/%Y %H:%M", "%m/%d/%y %H:%M", "%m/%d/%Y", "%Y-%m-%d", "%H:%M:%S")
  #Add extra formats to character vector above
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
